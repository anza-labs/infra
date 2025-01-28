## apps

This directory contains application-specific configurations and manifests. Each app is organized under a group, providing clear segmentation for multi-team or multi-project use cases.

### Structure

```
apps/
  $group/
    $app/
      *     Configuration for the specific app.
```

### Purpose

- Define app-specific overlays and configurations.
- Reference cluster and config resources to form complete deployments.
