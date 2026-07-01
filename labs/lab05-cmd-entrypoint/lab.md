# Lab 5: CMD vs ENTRYPOINT — ping as a flexible tool

> **Day 1 — Docker · CMD vs ENTRYPOINT**  
> KillerCoda: https://killercoda.com/tertiary-labs/course/killercoda/day1-01-docker-fundamentals

**Goal:** Understand the difference between CMD and ENTRYPOINT by building a `pinger` image. ENTRYPOINT locks in the tool (`ping`); CMD is the default target — which students can freely override at runtime.

**What you'll build:** A self-contained image where ENTRYPOINT is fixed and CMD is overridable — no extra files needed.

### The Dockerfile

```dockerfile
FROM alpine:3.18
# ENTRYPOINT = the fixed tool (always runs)
ENTRYPOINT ["ping", "-c", "3"]
# CMD = the default argument (replaced when you pass args to docker run)
CMD ["localhost"]
```

`ENTRYPOINT` is the executable that always runs. `CMD` is the **default argument** — here `localhost` — which is replaced by anything you pass on `docker run`.

### Build it

```bash
docker build -t pinger .
```

### CMD is the default; run args override it

```bash
# Default: pings localhost (CMD kicks in)
docker run --rm pinger

# Override CMD — same image, different target
docker run --rm pinger 8.8.8.8

docker run --rm pinger google.com
```

### Go further — even ENTRYPOINT can be overridden

```bash
# --entrypoint flag replaces ENTRYPOINT at runtime
docker run --rm --entrypoint sh pinger -c "echo I replaced the entrypoint"
```

### ENTRYPOINT vs CMD — the three tiers of flexibility

| Scenario | Command that runs |
| --- | --- |
| `docker run pinger` | `ping -c 3 localhost` (CMD default) |
| `docker run pinger 8.8.8.8` | `ping -c 3 8.8.8.8` (CMD overridden) |
| `docker run --entrypoint sh pinger` | `sh` (ENTRYPOINT overridden) |

|  | CMD only | ENTRYPOINT + CMD |
| --- | --- | --- |
| Dockerfile | `CMD ["ping","-c","3","localhost"]` | `ENTRYPOINT ["ping","-c","3"]`<br>`CMD ["localhost"]` |
| `docker run img` | pings localhost | pings localhost |
| `docker run img 8.8.8.8` | tries to run `8.8.8.8` as a command (error) | pings 8.8.8.8 ✔ |

> **Note:** Use **ENTRYPOINT** when the image *is* a specific tool and arguments vary. Use **CMD** alone when you want an easily replaceable default command. Both use the JSON *exec form* `["a","b"]` to avoid an extra shell process.

> ✅ **Test it:** `docker run --rm pinger` pings localhost, `docker run --rm pinger 8.8.8.8` pings Google DNS — same image, different argument, zero changes to the Dockerfile.
