package main

import (
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"gopkg.in/yaml.v3"
)

type PatchFile struct {
	Bases   []string
	Patches []Patch
}

type Patch struct {
	Op    string          `yaml:"op"`
	Path  string          `yaml:"path"`
	Value []EmbeddedPatch `yaml:"value"`
}

type EmbeddedPatch struct {
	Patch  string `yaml:"patch"`
	Target any    `yaml:"target"`
}

var id = 0

func next() int {
	id += 1
	return id
}

func main() {
	// Define the root directory containing the patch files
	rootDir := "versioned"
	err := filepath.Walk(rootDir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if !info.IsDir() && strings.HasSuffix(info.Name(), "-patch.yaml") {
			err := processPatchFile(path)
			if err != nil {
				fmt.Printf("Error processing patch file %s: %v\n", path, err)
			}
		}
		return nil
	})

	if err != nil {
		fmt.Printf("Error walking the path: %v\n", err)
	}
}

func processPatchFile(filePath string) error {
	var pf PatchFile
	var err error

	// Extract the base layers from the comments
	pf.Bases, err = extractBasesFromComments(filePath)
	if err != nil {
		return fmt.Errorf("error extracting bases from comments: %w", err)
	}

	// Read the patches content from the file
	err = readPatches(filePath, &pf.Patches)
	if err != nil {
		return fmt.Errorf("error reading patches: %w", err)
	}

	// Write the test environment
	dir, err := writeTest(pf)
	if err != nil {
		return fmt.Errorf("error writing test: %w", err)
	}

	// Run `kustomize build` on the test environment
	if err := runKustomizeBuild(dir); err != nil {
		return fmt.Errorf("kustomize build failed: %w", err)
	}

	return nil
}

func writeTest(pf PatchFile) (string, error) {
	dir := filepath.Join("./tmp/", fmt.Sprintf("test-%d", next()))

	// Create a temporary directory
	err := os.MkdirAll(dir, 0o700)
	if err != nil {
		return "", fmt.Errorf("failed to create temp dir: %w", err)
	}

	// Initialize the kustomization map
	kustomization := map[string]any{
		"resources": pf.Bases,
		"patches":   []map[string]any{},
	}

	// Iterate over each patch in all Patches
	for pi, patch := range pf.Patches {
		for vi, ep := range patch.Value {
			patchFile := filepath.Join(dir, fmt.Sprintf("patch-%d-%d.yaml", pi, vi))
			var patchContent []map[string]any
			if err := yaml.Unmarshal([]byte(ep.Patch), &patchContent); err != nil {
				return "", fmt.Errorf("failed to unmarshal embedded patch: %w", err)
			}

			patchData, err := yaml.Marshal(patchContent)
			if err != nil {
				return "", fmt.Errorf("failed to marshal patch: %w", err)
			}

			if err := os.WriteFile(patchFile, patchData, 0644); err != nil {
				return "", fmt.Errorf("failed to write patch file %d-%d: %w", pi, vi, err)
			}

			// Add patch reference to the kustomization map
			kustomization["patches"] = append(kustomization["patches"].([]map[string]any), map[string]any{
				"path":   fmt.Sprintf("./patch-%d-%d.yaml", pi, vi),
				"target": ep.Target,
			})
		}
	}

	// Write the kustomization.yaml file
	kustomizationFile := filepath.Join(dir, "kustomization.yaml")
	kustomizationData, err := yaml.Marshal(kustomization)
	if err != nil {
		return "", fmt.Errorf("failed to marshal kustomization.yaml: %w", err)
	}

	if err := os.WriteFile(kustomizationFile, kustomizationData, 0644); err != nil {
		return "", fmt.Errorf("failed to write kustomization.yaml: %w", err)
	}

	return dir, nil
}

func runKustomizeBuild(dir string) error {
	cmd := exec.Command("kustomize", "build", dir)
	cmd.Stdout = io.Discard
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func readPatches(filePath string, patches *[]Patch) error {
	b, err := os.ReadFile(filePath)
	if err != nil {
		return fmt.Errorf("failed to read patch file: %w", err)
	}
	err = yaml.Unmarshal(b, patches)
	if err != nil {
		return fmt.Errorf("failed to unmarshal patch file: %w", err)
	}
	return nil
}

func extractBasesFromComments(filePath string) ([]string, error) {
	buffer, err := os.ReadFile(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to read file %s: %w", filePath, err)
	}

	lines := strings.Split(string(buffer), "\n")
	var bases []string
	for _, line := range lines {
		if strings.HasPrefix(line, "# Base:") {
			b := strings.TrimSpace(strings.TrimPrefix(line, "# Base:"))
			bases = append(bases, filepath.Join("../../", b))
		}
	}

	if len(bases) == 0 {
		return nil, fmt.Errorf("no base comments found in file %s", filePath)
	}

	return bases, nil
}
