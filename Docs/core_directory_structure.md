# AI-Now Platform Directory Structure

This document outlines the recommended directory structure for the AI-Now platform, designed to support scalability from MVP to global deployment while maintaining clarity and modularity.

## Root Directory Structure

```
/ai-now-platform/
├── .github/                      # GitHub workflows and CI/CD configuration
├── apps/                         # Application components (monorepo approach)
│   ├── frontend/                 # Frontend applications
│   ├── backend/                  # Backend services
│   └── workers/                  # Background processing workers
├── packages/                     # Shared libraries and utilities
├── infrastructure/               # Infrastructure as Code
├── deployment/                   # Deployment configurations
├── scripts/                      # Utility scripts
├── docs/                         # Documentation
├── .dockerignore                 # Docker ignore file
├── .gitignore                    # Git ignore file
├── README.md                     # Project overview
└── package.json                  # Root package file for monorepo management
```

## Detailed Component Structure

### Frontend Applications

```
/ai-now-platform/apps/frontend/
├── dashboard/                    # Main dashboard application
│   ├── public/                   # Static assets
│   ├── src/
│   │   ├── assets/               # Images, fonts, etc.
│   │   ├── components/           # Reusable UI components
│   │   │   ├── common/           # Common components
│   │   │   ├── layout/           # Layout components
│   │   │   └── [feature]/        # Feature-specific components
│   │   ├── hooks/                # Custom React hooks
│   │   ├── pages/                # Page components
│   │   ├── services/             # API services
│   │   │   ├── apollo/           # Apollo.io API integration
│   │   │   ├── make/             # Make.com API integration
│   │   │   └── api/              # Internal API clients
│   │   ├── store/                # State management
│   │   ├── styles/               # Global styles
│   │   ├── utils/                # Utility functions
│   │   ├── App.tsx               # Main application component
│   │   └── index.tsx             # Entry point
│   ├── .env.example              # Example environment variables
│   ├── Dockerfile.dev            # Development Dockerfile
│   ├── Dockerfile.prod           # Production Dockerfile
│   ├── package.json              # Package configuration
│   └── tsconfig.json             # TypeScript configuration
├── admin/                        # Admin portal (similar structure)
└── mobile/                       # Mobile application (if applicable)
```

### Backend Services

```
/ai-now-platform/apps/backend/
├── api-gateway/                  # API Gateway service
│   ├── src/
│   │   ├── config/               # Configuration
│   │   ├── controllers/          # Request handlers
│   │   ├── middleware/           # Middleware functions
│   │   ├── routes/               # API routes
│   │   ├── services/             # Business logic
│   │   ├── utils/                # Utility functions
│   │   └── index.ts              # Entry point
│   ├── .env.example              # Example environment variables
│   ├── Dockerfile.dev            # Development Dockerfile
│   ├── Dockerfile.prod           # Production Dockerfile
│   ├── package.json              # Package configuration
│   └── tsconfig.json             # TypeScript configuration
├── lead-service/                 # Lead management service
│   ├── src/
│   │   ├── config/               # Configuration
│   │   ├── controllers/          # Request handlers
│   │   ├── models/               # Data models
│   │   ├── repositories/         # Data access layer
│   │   ├── services/             # Business logic
│   │   │   ├── apollo/           # Apollo.io integration
│   │   │   ├── enrichment/       # Data enrichment
│   │   │   └── scoring/          # Lead scoring
│   │   ├── utils/                # Utility functions
│   │   └── index.ts              # Entry point
│   ├── .env.example              # Example environment variables
│   ├── Dockerfile.dev            # Development Dockerfile
│   ├── Dockerfile.prod           # Production Dockerfile
│   ├── package.json              # Package configuration
│   └── tsconfig.json             # TypeScript configuration
├── automation-service/           # Workflow automation service
│   ├── src/
│   │   ├── config/               # Configuration
│   │   ├── controllers/          # Request handlers
│   │   ├── integrations/         # Third-party integrations
│   │   │   ├── make/             # Make.com integration
│   │   │   ├── zapier/           # Zapier integration
│   │   │   └── crm/              # CRM integrations
│   │   ├── workflows/            # Workflow definitions
│   │   ├── utils/                # Utility functions
│   │   └── index.ts              # Entry point
│   ├── .env.example              # Example environment variables
│   ├── Dockerfile.dev            # Development Dockerfile
│   ├── Dockerfile.prod           # Production Dockerfile
│   ├── package.json              # Package configuration
│   └── tsconfig.json             # TypeScript configuration
├── outreach-service/             # Outreach management service
├── analytics-service/            # Analytics and reporting service
└── auth-service/                 # Authentication and authorization service
```

### Background Workers

```
/ai-now-platform/apps/workers/
├── lead-enrichment/              # Lead enrichment worker
│   ├── src/
│   │   ├── config/               # Configuration
│   │   ├── processors/           # Data processors
│   │   ├── services/             # Business logic
│   │   ├── utils/                # Utility functions
│   │   └── index.ts              # Entry point
│   ├── .env.example              # Example environment variables
│   ├── Dockerfile.dev            # Development Dockerfile
│   ├── Dockerfile.prod           # Production Dockerfile
│   ├── package.json              # Package configuration
│   └── tsconfig.json             # TypeScript configuration
├── data-sync/                    # Data synchronization worker
├── email-processor/              # Email processing worker
└── scheduled-tasks/              # Scheduled tasks worker
```

### Shared Packages

```
/ai-now-platform/packages/
├── common/                       # Common utilities and types
│   ├── src/
│   │   ├── types/                # Shared TypeScript types
│   │   ├── utils/                # Shared utility functions
│   │   ├── constants/            # Shared constants
│   │   └── index.ts              # Entry point
│   ├── package.json              # Package configuration
│   └── tsconfig.json             # TypeScript configuration
├── ui-components/                # Shared UI components
│   ├── src/
│   │   ├── components/           # UI components
│   │   ├── styles/               # Component styles
│   │   └── index.ts              # Entry point
│   ├── package.json              # Package configuration
│   └── tsconfig.json             # TypeScript configuration
├── api-client/                   # Shared API client
├── logger/                       # Logging utilities
└── database/                     # Database utilities and models
```

### Infrastructure as Code

```
/ai-now-platform/infrastructure/
├── terraform/                    # Terraform configurations
│   ├── modules/                  # Reusable Terraform modules
│   │   ├── networking/           # Network infrastructure
│   │   ├── kubernetes/           # Kubernetes cluster
│   │   ├── databases/            # Database resources
│   │   └── monitoring/           # Monitoring resources
│   ├── environments/             # Environment-specific configurations
│   │   ├── dev/                  # Development environment
│   │   ├── staging/              # Staging environment
│   │   └── prod/                 # Production environment
│   └── providers/                # Provider-specific configurations
│       ├── aws/                  # AWS configurations
│       ├── gcp/                  # GCP configurations
│       └── digitalocean/         # DigitalOcean configurations
├── pulumi/                       # Pulumi configurations (alternative to Terraform)
└── scripts/                      # Infrastructure scripts
```

### Deployment Configurations

```
/ai-now-platform/deployment/
├── docker/                       # Docker Compose files
│   ├── docker-compose.yml        # Development Docker Compose
│   └── docker-compose.prod.yml   # Production Docker Compose
├── kubernetes/                   # Kubernetes manifests
│   ├── base/                     # Base Kubernetes configurations
│   │   ├── namespaces/           # Namespace definitions
│   │   ├── services/             # Service definitions
│   │   ├── deployments/          # Deployment definitions
│   │   ├── configmaps/           # ConfigMap definitions
│   │   └── secrets/              # Secret definitions
│   ├── overlays/                 # Environment-specific overlays
│   │   ├── dev/                  # Development environment
│   │   ├── staging/              # Staging environment
│   │   └── prod/                 # Production environment
│   └── charts/                   # Helm charts
├── ci-cd/                        # CI/CD configurations
│   ├── github-actions/           # GitHub Actions workflows
│   ├── gitlab-ci/                # GitLab CI configurations
│   └── jenkins/                  # Jenkins configurations
└── scripts/                      # Deployment scripts
```

### Documentation

```
/ai-now-platform/docs/
├── architecture/                 # Architecture documentation
│   ├── overview.md               # System overview
│   ├── frontend.md               # Frontend architecture
│   ├── backend.md                # Backend architecture
│   └── infrastructure.md         # Infrastructure architecture
├── development/                  # Development documentation
│   ├── setup.md                  # Development environment setup
│   ├── workflow.md               # Development workflow
│   └── standards.md              # Coding standards
├── api/                          # API documentation
│   ├── internal/                 # Internal API documentation
│   └── external/                 # External API documentation
├── deployment/                   # Deployment documentation
│   ├── local.md                  # Local deployment
│   ├── cloud.md                  # Cloud deployment
│   └── scaling.md                # Scaling strategies
└── user/                         # User documentation
    ├── getting-started.md        # Getting started guide
    ├── features.md               # Feature documentation
    └── troubleshooting.md        # Troubleshooting guide
```

## Scalability Considerations

This directory structure is designed with the following scalability considerations:

1. **Monorepo Approach**: Using a monorepo structure allows for shared code, consistent versioning, and simplified dependency management while maintaining clear boundaries between components.

2. **Microservices Architecture**: Backend services are organized as independent microservices, each with its own responsibility and deployment lifecycle.

3. **Shared Packages**: Common functionality is extracted into shared packages to promote code reuse and consistency.

4. **Infrastructure as Code**: All infrastructure is defined as code, enabling consistent deployment across environments and cloud providers.

5. **Environment Separation**: Clear separation between development, staging, and production environments.

6. **Multi-Cloud Support**: Infrastructure and deployment configurations support multiple cloud providers.

7. **Containerization**: All services are containerized for consistent deployment and scaling.

8. **Kubernetes-Ready**: Directory structure supports Kubernetes deployment with base configurations and environment-specific overlays.

9. **CI/CD Integration**: Built-in support for continuous integration and deployment.

10. **Documentation**: Comprehensive documentation structure to support team growth and knowledge sharing.

## MVP vs. Global Deployment

This directory structure supports both MVP and global deployment scenarios:

### MVP Phase
- Start with core services (lead-service, automation-service, api-gateway)
- Use simplified infrastructure (single cloud provider, minimal redundancy)
- Focus on essential features and integrations

### Global Deployment
- Scale to full service complement
- Implement multi-region deployment
- Utilize advanced Kubernetes features (StatefulSets, custom resources)
- Implement global load balancing and data replication
- Add specialized workers for region-specific processing

The structure is designed to grow organically from MVP to global scale without requiring significant reorganization.
