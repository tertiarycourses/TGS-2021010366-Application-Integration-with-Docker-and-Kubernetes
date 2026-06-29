# CLAUDE.md

Guidance for working in this repository.

## What this is

Courseware **and** hands-on labs for the WSQ course **Application Integration with Docker and
Kubernetes** (TGS-2021010366, Tertiary Infotech Academy, 2 days). This is a teaching/training
repo, not a deployable app. Everything is built around one realistic sample application —
**TaskBoard** (a Flask task tracker + Redis + PostgreSQL) — carried from a single container to
Docker Compose to Kubernetes.

## Single source of truth

All course content lives in **`labs_data.py`** inside the **`courseware-build`** skill
([.claude/skills/courseware-build/](.claude/skills/courseware-build/)). Every artifact — the
`labs/` folder, the slide deck, the Lesson Plan, the Learner Guide and its Markdown mirror — is
**generated** from it, so they stay 100% aligned. To change course content, edit `labs_data.py`
and re-run the generators; never hand-edit the generated files.

```bash
SK=.claude/skills/courseware-build
python3 $SK/build_labs.py          # -> labs/labNN-*/lab.md + working files
python3 $SK/build_slides.py        # -> courseware/…​.pptx  (all-white n8n house style)
python3 $SK/build_lesson_plan.py   # -> courseware/LP-…​.docx
python3 $SK/build_learner_guide.py # -> LG-…​.md (root) + courseware/LG-…​.docx
# PDFs:
soffice --headless --convert-to pdf --outdir courseware courseware/*.pptx courseware/LP-*.docx courseware/LG-*.docx
```

## Layout

| Path | Purpose |
|---|---|
| `labs/` | 19 labs (`lab01`–`lab19`), the shared app in `labs/app/`, and `labs/assessments/`. Generated. |
| `courseware/` | Generated deliverables: PPTX, LP/LG DOCX + PDFs, plus `assets/` (logos, icons via the slides skill). |
| `LG-…​.md` | Learner Guide Markdown mirror (root). Generated. |
| `README.md` | Public course overview + lab index. |
| `.claude/skills/courseware-build/` | The build pipeline (all generator `.py` live here, not the repo root). |

## Conventions

- **Topics covered.** Docker: fundamentals, Dockerfile & build, CMD vs ENTRYPOINT, storage,
  networking, configuration, Docker Hub, Compose. Kubernetes: Pods, Namespaces, Deployments,
  rollouts, Services, storage, Jobs/CronJobs.
- **Labs are realistic** and follow the KillerCoda scenarios (each `lab.md` cites its KillerCoda URL).
- **Slides are all-white** (n8n house style) — never a dark theme. Lesson Plan is 9:00 AM–6:00 PM,
  8 training hours/day, Day 2 assessment at 4:00 PM. The Learner Guide is step-by-step per lab.
- Generated artifacts are produced by the `courseware-build` skill — regenerate, don't hand-edit.
