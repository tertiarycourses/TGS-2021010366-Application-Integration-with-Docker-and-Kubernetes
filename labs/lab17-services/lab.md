# Lab 17: Services — ClusterIP & NodePort

> **Day 2 — Kubernetes · Services**  
> KillerCoda: https://killercoda.com/tertiary-labs/course/killercoda/day2-04-k8s-services

**Goal:** Give your Pods a stable address. Pod IPs change constantly; a Service provides one durable endpoint with built-in load balancing. You'll expose TaskBoard internally with ClusterIP and externally with NodePort, both imperatively and from YAML.

**What you'll build:** Expose a Deployment with ClusterIP (internal) and NodePort (external) Services.

### Part A — ClusterIP (internal)

```bash
kubectl create deployment taskboard --image=nginx --replicas=2
kubectl expose deployment taskboard --port=80 --target-port=80
kubectl get service taskboard
kubectl get endpoints taskboard      # the Pod IPs behind the Service
```

### Part B — NodePort (external)

```bash
kubectl delete service taskboard
kubectl expose deployment taskboard \
  --type=NodePort --port=80 --target-port=80
kubectl get service taskboard         # note the 3xxxx port
```

### Part C — Declarative (Service + Deployment YAML)

```yaml
apiVersion: v1
kind: Service
metadata:
  name: taskboard-svc
spec:
  type: NodePort
  selector:
    app: taskboard
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30080
```

```bash
kubectl delete deployment taskboard service taskboard
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get svc taskboard-svc          # NodePort 30080
kubectl delete -f service.yaml -f deployment.yaml
```

> **Note:** ClusterIP is internal-only (service-to-service). NodePort opens a port on every node for outside access. In the cloud, LoadBalancer fronts NodePort with a real external IP.

> ✅ **Test it:** `kubectl get endpoints taskboard` lists 2 Pod IPs behind the Service, and the NodePort Service shows a port in the 30000–32767 range.
