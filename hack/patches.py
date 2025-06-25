import os
import sys
import yaml
from pathlib import Path

def load_yaml_documents(file_path):
    with open(file_path, 'r') as f:
        return list(yaml.safe_load_all(f))

def extract_flux_kustomization_patches(docs):
    extracted_patches = {}

    for doc in docs:
        if (
            doc
            and doc.get("apiVersion") == "kustomize.toolkit.fluxcd.io/v1"
            and doc.get("kind") == "Kustomization"
        ):
            objPath = doc.get("spec").get("path")
            patches = doc.get("spec").get("patches")
            if patches:
                extracted_patches[objPath] = patches

    return extracted_patches

def write_kustomization_with_patches(patches, output_dir):
    i = 0
    for resource, patch in patches.items():
        i = i + 1
        od = Path(output_dir) / str(i)
        od.mkdir(parents=True, exist_ok=True)

        kustomization = {
            "apiVersion": "kustomize.config.k8s.io/v1beta1",
            "kind": "Kustomization",
            "resources": [str(Path("../..") / resource)],
            "patches": patch
        }

        with open(od / "kustomization.yaml", "w") as f:
            yaml.safe_dump(kustomization, f)

def main(input_path, output_dir):
    input_path = Path(input_path)

    if input_path.is_file():
        files = [input_path]
    else:
        files = list(input_path.glob("*.yaml")) + list(input_path.glob("*.yml"))

    all_docs = []
    for file in files:
        docs = load_yaml_documents(file)
        all_docs.extend(docs)

    patches = extract_flux_kustomization_patches(all_docs)

    print(f"Found {len(patches)} patch(es)")

    if patches:
        write_kustomization_with_patches(patches, output_dir)
        print(f"Patches written to {output_dir}/kustomization.yaml")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python extract_flux_patches.py <input_path> <output_dir>")
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])
