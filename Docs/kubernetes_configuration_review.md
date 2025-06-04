# Kubernetes Configuration Guide for SafeShipping

## Key Points

The document provides a comprehensive Kubernetes configuration guide for the SafeShipping blockchain-based supply chain solution:

### Project Overview

SafeShipping is a blockchain-based supply chain solution that leverages:
- Smart contracts
- Decentralized oracles
- IoT integration
- Cross-chain interoperability

The solution aims to provide secure, transparent, and efficient shipping logistics.

### Directory Structure

The document outlines a detailed directory structure for Kubernetes manifests:

```
/safeshipping/kubernetes/
├── namespace.yaml                    # Namespace definition
├── blockchain-node-configmap.yaml    # ConfigMap for blockchain node
├── blockchain-node-pvc.yaml          # PersistentVolumeClaim for blockchain data
├── blockchain-node-deployment.yaml   # Deployment for blockchain node
├── blockchain-node-service.yaml      # Service for blockchain node
├── oracle-service-configmap.yaml     # ConfigMap for oracle service
├── oracle-service-deployment.yaml    # Deployment for oracle service
├── oracle-service-service.yaml       # Service for oracle service
├── backend-api-configmap.yaml        # ConfigMap for backend API
├── backend-api-deployment.yaml       # Deployment for backend API
├── backend-api-service.yaml          # Service for backend API
├── backend-secrets.yaml              # Secrets for backend API
├── frontend-configmap.yaml           # ConfigMap for frontend nginx
├── frontend-deployment.yaml          # Deployment for frontend
├── frontend-service.yaml             # Service for frontend
├── security-service-configmap.yaml   # ConfigMap for security service
├── security-service-deployment.yaml  # Deployment for security service
├── security-service-service.yaml     # Service for security service
├── smart-contracts-deployment.yaml   # Deployment for smart contracts
├── smart-contracts-service.yaml      # Service for smart contracts
└── ingress.yaml                      # Ingress for external access
```

### Kubernetes Components

The guide includes detailed YAML configurations for various Kubernetes resources:

1. **Namespace**
   - Creates a dedicated namespace for all SafeShipping resources

2. **Blockchain Node**
   - ConfigMap with Ethereum node configuration and startup scripts
   - PersistentVolumeClaim for blockchain data storage
   - Deployment with resource limits, probes, and volume mounts
   - Service for exposing RPC, WebSocket, and P2P ports

3. **Oracle Service**
   - ConfigMap with oracle service configuration
   - Deployment with replicas, resource limits, and health checks
   - Service for internal communication

4. **Backend API**
   - ConfigMap with backend API configuration
   - Secrets for sensitive information
   - Deployment with resource specifications
   - Service for exposing the API

5. **Frontend**
   - ConfigMap with Nginx configuration
   - Deployment for the frontend application
   - Service for internal access

6. **Security Service**
   - ConfigMap with security service configuration
   - Deployment with resource specifications
   - Service for internal communication

7. **Smart Contracts**
   - Deployment for smart contract management
   - Service for exposing contract functionality

8. **Ingress**
   - Configuration for external access to the application

## Technical Architecture Highlights

- Dedicated namespace for resource isolation
- Persistent storage for blockchain data
- Resource limits and requests for all components
- Health checks and readiness probes
- ConfigMaps for configuration management
- Secrets for sensitive information
- Service definitions for internal communication
- Ingress for external access
- Horizontal scaling for appropriate services
- Clear separation of concerns between components
