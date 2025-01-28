# Manifests

## GitOps using Flux and Renovate

### Overview

This repository serves as a complementary resource to the [anza-labs/infra](https://github.com/anza-labs/infra) repository, focusing on the deployment and management of applications in Kubernetes clusters. It contains a curated collection of applications packaged into kustomize configurations, which can be seamlessly deployed and managed using Flux, a GitOps tool that ensures your Kubernetes clusters are always in sync with your desired state as represented in Git.

The primary goal of this repository is to provide a streamlined and automated approach to managing Kubernetes applications. By leveraging GitOps principles, all changes to the cluster state are tracked and version-controlled, ensuring a clear audit trail and easy rollback if necessary. Flux continuously monitors your Git repository for changes and applies them to the cluster, making it a powerful tool for maintaining the desired state of your infrastructure.

```mermaid
graph TD
    subgraph apps
        subgraph a_groups[ $group ]
            subgraph ag_app[ $app ]
                aga_kustomization[ kustomization ]
            end
        end
    end

    subgraph clusters
        subgraph q_cluster[ $cluster ]
            qc_kustomization[ kustomization ]
        end
    end

    subgraph configs
        subgraph c_groups[ $group ]
            subgraph cg_app[ $app_config ]
                cga_kustomization[ kustomization ]
                cga_manifests[ manifests ]
            end
        end
    end

    subgraph environments
        subgraph e_base[ base ]
            eb_kustomization[ kustomization ]
        end
        subgraph e_environment[ $environment ]
            ee_kustomization[ kustomization ]
        end
    end

    subgraph repositories
        r_kustomization[ kustomization ]
    end

    subgraph versioned
        subgraph v_cluster[ $cluster ]
            vc_kustomization[ kustomization ]
            vc_patches[ patches ]
        end
    end

    vc_patches --> vc_kustomization
    cga_kustomization --> cga_manifests
    ee_kustomization --> eb_kustomization
    eb_kustomization --> r_kustomization
    qc_kustomization --> vc_kustomization
    qc_kustomization --> ee_kustomization
    aga_kustomization --> cga_kustomization
    vc_kustomization --> aga_kustomization
```

### Automated Updates

Renovate is configured to automatically check for updates to dependencies. Refer to `renovate.json` for configuration details.

### License

This repository is licensed under the [The Unlicense](LICENSE). Feel free to modify and adapt it for your needs.

### Contribution

Feel free to contribute by opening issues or submitting pull requests. Your feedback and contributions are highly appreciated!
