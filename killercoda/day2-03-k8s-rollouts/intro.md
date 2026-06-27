# Rollouts & Rollbacks

Kubernetes performs **rolling updates** — new Pods come up before old ones come down, giving zero downtime.
If a bad image is deployed, **rollback** restores the previous version instantly.

**What you will learn:**
- Update a Deployment image
- Monitor rollout progress
- Rollback to a previous version
