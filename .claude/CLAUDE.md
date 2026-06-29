# CLAUDE.md — WSQ Courseware Project (v4)

## Course
**Application Integration with Docker and Kubernetes**
TGS Ref No: TGS-2021010366
Instructor: Dr. Alfred Ang
Institution: Tertiary Infotech Pte. Ltd.
Duration: 2 days

---

## Source & Design Reference
- **Design reference** (read-only, DO NOT copy content from):
  `Agentic AI Applications with Claude Code - v12.pptx`
- **Lab content** — KillerCoda GitHub:
  https://github.com/tertiarycourses/TGS-2021010366-Application-Integration-with-Docker-and-Kubernetes/tree/main/killercoda
- **v20.pptx is RETIRED** — do not open, read, or reference it in any new work

## Working outputs
| File | Contents | Target slides |
|---|---|---|
| `Docker_Kubernetes_v4.pptx` | Combined Day 1 (Docker) + Day 2 (Kubernetes) | ~120–130 |
| `build_courseware_v3.py` | Single build script for both days | — |

---

## Design System (Horizon — replaces v12)

### Colours
| Token | Hex | Usage |
|---|---|---|
| C_DARK | #0D1B2A | Deep navy — dark slide backgrounds |
| C_HEADER | #125AAF | Royal blue — Docker content header band |
| C_K8S_HDR | #006D5E | Deep teal — K8s content header band |
| C_ORANGE | #029AE8 | Sky blue — accent labels (token kept for code compat) |
| C_K8S | #009988 | Teal — K8s accent colour |
| C_WHITE | #FFFFFF | Text on dark backgrounds |
| C_CREAM | #F4F8FF | Cool white — content slide background |
| C_TEXT | #0F1A2C | Near-black — body text |
| C_MUTED | #526A7E | Blue-gray — secondary text |
| C_MUTED2 | #8AA6BB | Lighter blue-gray — text on dark bg |
| C_FOOTER | #6A869C | Footer text |
| C_NAVY | #0A3C8C | Dark blue — code text |
| C_BLUE | #029AE8 | KillerCoda URLs, hyperlinks |
| C_CODEBG | #DFECFB | Light blue — code block background |
| C_AMBER | #FFF3E0 | Knowledge Check background tint |
| C_LTBLUE | #EEF2FF | Assessment background tint |

### Typography & Layout (slide size: 13.33" × 7.50")
| Element | Font | Size | Style | Position |
|---|---|---|---|---|
| Left accent bar | — | — | C_ORANGE rect | x=0 y=0 w=0.07" h=7.50" |
| Header band | — | — | C_HEADER rect | x=0.07" y=0 w=13.26" h=1.50" |
| Content label | Calibri | 11pt | Bold WHITE | inside header y=0.24" |
| Content title | Cambria | 26pt | Bold WHITE | inside header y=0.58" |
| Body text | Calibri | 15pt | Regular C_TEXT | y=1.72" |
| Code block | Courier New | 9pt | C_NAVY on C_CODEBG | — |
| Footer | Calibri | 9pt | C_FOOTER | y=7.10" |
| KillerCoda URL | Calibri | 11pt | Italic C_BLUE | y=6.52" |
| Section divider label | Calibri | 13pt | Bold C_ORANGE | x=0.75" y=1.75" |
| Section divider title | Cambria | 40pt | Bold WHITE | x=0.75" y=2.28" |
| Section divider left bar | — | — | C_ORANGE rect | x=0 y=0 w=0.55" h=7.50" |

### Slide types
| Type | Background | Notes |
|---|---|---|
| Cover | C_DARK + C_ORANGE accent bar | No header band |
| Day 2 transition | C_DARK + C_K8S accent bar | K8s teal accent |
| Section divider (Docker) | C_DARK + thick C_ORANGE left bar | 40pt title |
| Section divider (K8s) | C_DARK + thick C_K8S left bar | Teal accent |
| Lab header (Docker) | C_DARK + C_ORANGE panel + top line | — |
| Lab header (K8s) | C_DARK + C_K8S panel + top line | — |
| Content / Theory (Docker) | C_CREAM + C_HEADER band | Blue header |
| Content / Theory (K8s) | C_CREAM + C_K8S_HDR band | Teal header |
| Knowledge Check | C_AMBER | Amber tint, no header band |
| Assessment | C_LTBLUE | Blue tint, no header band |
| Closing | C_DARK | Dark, no header band |

---

## 2-Day Lab Map

### Day 1 — Docker (~60 slides)
| Scenario | Labs | Topics |
|---|---|---|
| day1-01-docker-fundamentals | Lab 1–4 | Run containers, build images, Flask app |
| day1-02-docker-storage | Lab 5a–5b | Named volumes, bind mounts |
| day1-03-docker-networking | Lab 6–7 | Custom networks, port mapping |
| day1-04-docker-config | Lab 8 | Environment variables |
| day1-05-docker-compose | Lab 10–12 | Compose, multi-service, full-stack |

### Day 2 — Kubernetes (~65 slides)
| Scenario | Labs | Topics |
|---|---|---|
| day2-01-k8s-pods-namespaces | Lab 13–14 | Pods, Namespaces |
| day2-02-k8s-deployments | Lab 15 | Deployments, scaling, self-healing |
| day2-03-k8s-rollouts | Lab 16 | Rolling updates, rollbacks |
| day2-04-k8s-services | Lab 17 | ClusterIP, NodePort |
| day2-05-k8s-storage-jobs | Lab 18–19 | PV/PVC, Jobs, CronJobs |

### Reference Only (not in KillerCoda)
- Lab 9: Push to Docker Hub — shown as theory slide, no activity slide

---

## Build Rules

1. **Never reference v20.pptx** — it is retired. All slides are generated fresh.
2. **Design: Horizon system** — use the Horizon colours, header bands, and accent bars defined above. Do NOT use v12 colours or layout.
3. **Content** — lab commands from KillerCoda; concept explanations from official Docker/K8s docs (docs.docker.com, kubernetes.io). Never invent commands.
4. **No bullets** — call `_no_bullet()` on every paragraph.
5. **Every lab slide** must show the KillerCoda URL (italic, C_BLUE).
6. **Footer on every slide** — Calibri 9pt, C_FOOTER, three-part: copyright | course | page number.
7. **Slide targets**: Day 1 ≈ 60, Day 2 ≈ 65, total ≈ 120–130.
8. **Each lab section** = max 3 slides: lab header (dark) + commands + expected output/key concepts.
