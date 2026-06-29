# Test 4: Volumes and Services

## Part A: Routing Traffic to Pods from Inside and Outside of a Cluster

1. Create a deployment named `myapp` that creates 2 replicas for Pods with the image `nginx`. Expose the container port 80.
2. Expose the Pods so that requests can be made against the service from inside of the cluster.
3. Create a temporary Pod using the image `busybox` and run a `wget` command against the IP of the service.
4. Change the service type so that the Pods can be reached from outside of the cluster.
5. Run a `wget` command against the service from outside of the cluster.
6. (Optional) Can you expose the Pods as a service without a deployment?

## Part B: Persistent Storage

1. Create a Persistent Volume named `my-pv` with 1Gi storage using `hostPath` at `/tmp/k8s-data`.
2. Create a Persistent Volume Claim named `my-pvc` requesting 500Mi storage.
3. Verify the PVC is bound to the PV.
4. Create a Pod named `storage-pod` using the image `busybox` that mounts the PVC at `/data` and writes "hello from storage" to `/data/message.txt`.
5. Delete the Pod, recreate it, and verify the data persists.
6. Clean up all resources (Pod, PVC, PV).
