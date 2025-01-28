# Versioned

This directory manages versioned configurations, allowing for traceability and patch management. It uses a "patches-of-patches" pattern to apply modifications dynamically and ensure proper testing for each layer of patches.

## Purpose
- Maintain versioned Kubernetes resources.
- Track changes and apply cluster-specific patches as needed.

## Structure

```
versioned/
  $cluster/
    *            Versioned files.
    patches/     Version-specific patches.
```

The folder is organized as follows:

- `$REPO/versioned/*/kustomization.yaml`: Each subdirectory contains a `kustomization.yaml` file that defines the base resources and the patches to apply.
- `$REPO/versioned/*/patches/*-patch.yaml`: These files contain individual patches applied to Flux Kustomizations from `$REPO/config`.

## Patches-of-Patches Pattern

This pattern works by layering modifications through multiple stages:

1. **Initial kustomization** applies patches to a base configuration.
2. **Intermediate Flux Kustomization** introduces another layer of patches for additional changes.
3. **Final kustomization** manages the resources resulting from the applied patches.

This approach enables a modular and structured way to manage complex resource configurations, ensuring clarity and reusability.

## Testing the Patches

Each patch is tested in a controlled environment to ensure it works as intended:

1. **Extract Base Comments**: Each patch file (`*-patch.yaml`) includes comments like `# Base: ./path/to/base`, which define the resources it modifies.
2. **Temporary Test Environment**: A temporary directory is created for each test.
3. **Generate `kustomization.yaml`**: The base resources and patches are referenced in a dynamically generated `kustomization.yaml` file.
4. **Apply Patches**: All patches are applied in sequence using `kustomize build`.
5. **Validate Output**: The output is inspected to confirm that the patches have been applied correctly.

This testing process ensures compatibility between the patches and the base resources, as well as between dependent patches.
