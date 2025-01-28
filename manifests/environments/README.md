## environments

This directory defines environment-specific configurations, segmented into `base` (common configuration) and specific environments.

### Structure

```
environments/
  base/
    *     Base environment configurations.
  $environment/
    *     Environment-specific overlays.
```

### Purpose

- Centralize base configurations for shared resources.
- Apply environment-specific overrides as needed.
