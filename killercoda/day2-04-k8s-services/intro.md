# Kubernetes Services

Pods get a new IP every restart. A **Service** gives a stable DNS name that always routes to healthy Pods.

| Type | Access | Use case |
|---|---|---|
| ClusterIP | Inside cluster only | Service-to-service |
| NodePort | Outside via node IP | Dev/testing |
| LoadBalancer | Cloud load balancer | Production |
