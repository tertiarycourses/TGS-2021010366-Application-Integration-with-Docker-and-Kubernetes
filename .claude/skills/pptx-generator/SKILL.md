---
name: pptx-generator
description: >
  Build or update the Docker & Kubernetes courseware slide deck (v3).
  Use when the user asks to update, fix, improve, or regenerate slides.
  Design: Horizon Design System (NOT v12). Content: KillerCoda labs + official Docker/K8s docs.
  Never use v20.pptx — it is retired.
---

# PPTX Generator Skill — Application Integration with Docker and Kubernetes (v3)

## Course
- TGS-2021010366 | Instructor: Dr. Alfred Ang | Tertiary Infotech Pte. Ltd. | 2 days
- KillerCoda: https://killercoda.com/tertiary-labs/course/killercoda
- GitHub labs: https://github.com/tertiarycourses/TGS-2021010366-Application-Integration-with-Docker-and-Kubernetes/tree/main/killercoda

## STEP 1 — Understand what to change
1. Read `build_courseware_v3.py` — single source of truth for all slides
2. Fetch KillerCoda step files from GitHub if lab content needs updating
3. Fetch official Docker docs (docs.docker.com) or K8s docs (kubernetes.io) for concept slides
4. Do NOT read or reference v20.pptx — it is retired

## STEP 2 — Slide structure

**Total: ~130–145 slides across 2 days**

### Day 1 — Docker
- Cover + 3 admin slides
- Section 1: What is Docker? — containers, isolation, images, registry
- Section 2: Labs 1–2 — Running containers
- Section 3: Dockerfile — layers, best practices, Labs 3–4
- Section 4: Storage — Named volumes, Bind mounts, Labs 5a/5b
- Section 5: Networking — drivers, custom networks, port mapping, Labs 6–7
- Section 6: Config — env vars, Lab 8, Docker Hub
- Knowledge Check 1
- Section 7: Docker Compose — anatomy, Labs 10–12
- Knowledge Check 2 + Summary + Day 1 Closing

### Day 2 — Kubernetes
- Day 2 transition + outline
- Section 1: K8s Overview — architecture, kubectl, core objects
- Sections 2–8: Pods, Namespaces, Deployments, Rollouts, Services, Storage, Jobs
- Knowledge Checks + Summary + Assessment + Closing

## STEP 3 — Design system (Horizon)

### Colours
```python
C_DARK    = RGBColor(0x0D, 0x1B, 0x2A)  # deep navy  — dark slide bg
C_HEADER  = RGBColor(0x12, 0x5A, 0xAF)  # royal blue — Docker header band
C_K8S_HDR = RGBColor(0x00, 0x6D, 0x5E)  # deep teal  — K8s header band
C_ORANGE  = RGBColor(0x02, 0x9A, 0xE8)  # sky blue   — accent labels (kept as C_ORANGE for compat)
C_K8S     = RGBColor(0x00, 0x99, 0x88)  # teal       — K8s accent
C_WHITE   = RGBColor(0xFF, 0xFF, 0xFF)
C_CREAM   = RGBColor(0xF4, 0xF8, 0xFF)  # cool white — content bg
C_TEXT    = RGBColor(0x0F, 0x1A, 0x2C)  # near-black — body text
C_MUTED   = RGBColor(0x52, 0x6A, 0x7E)  # blue-gray  — secondary text
C_MUTED2  = RGBColor(0x8A, 0xA6, 0xBB)  # lighter    — text on dark bg
C_FOOTER  = RGBColor(0x6A, 0x86, 0x9C)  # footer text
C_NAVY    = RGBColor(0x0A, 0x3C, 0x8C)  # code text
C_BLUE    = RGBColor(0x02, 0x9A, 0xE8)  # URLs / KillerCoda links
C_CODEBG  = RGBColor(0xDF, 0xEC, 0xFB)  # light blue — code block bg
C_AMBER   = RGBColor(0xFF, 0xF3, 0xE0)  # knowledge check bg
C_LTBLUE  = RGBColor(0xEE, 0xF2, 0xFF)  # assessment bg
```

### Fonts & Layout (13.33" × 7.50" slides)
| Element | Font | Size | Style | Position |
|---|---|---|---|---|
| Header band | — | — | Rectangle bg | x=0.07" y=0 w=13.26" h=1.50" |
| Left accent bar | — | — | Rectangle bg | x=0 y=0 w=0.07" h=7.50" |
| Section label | Calibri | 11pt | Bold, WHITE | inside header y=0.24" |
| Content title | Cambria | 26pt | Bold, WHITE | inside header y=0.58" |
| Body text | Calibri | 15pt | Regular, C_TEXT | y=1.72" |
| Code block | Courier New | 9pt | C_NAVY on C_CODEBG | |
| Footer | Calibri | 9pt | C_FOOTER | y=7.10" |
| KillerCoda URL | Calibri | 11pt | Italic, C_BLUE | y=6.52" |

### Slide type → background
| Type | Background | Notes |
|---|---|---|
| Cover / Transition / Closing | C_DARK + C_ORANGE accent bar | No header band |
| Section divider | C_DARK + thick left accent bar | Title 40pt white |
| Lab header | C_DARK + accent bar + top line | Lab# in accent colour |
| Content / Theory (Docker) | C_CREAM + C_HEADER band | Blue header |
| Content / Theory (K8s) | C_CREAM + C_K8S_HDR band | Teal header |
| Knowledge Check | C_AMBER tint | Orange/amber theme |
| Assessment | C_LTBLUE tint | Blue theme |

### Helper functions in build_courseware_v3.py
```python
set_bg(slide, color)
add_textbox(slide, text, x,y,w,h, font,size,bold,italic,color,align,wrap)
add_footer(slide, page_num, dark=False)   # dark=True uses C_MUTED2 text
add_rect(slide, x,y,w,h, fill)
add_circle(slide, cx,cy,r, fill, alpha)
add_body_lines(slide, lines, x,y,w)
    # ('T', text)  Calibri 15pt C_TEXT
    # ('B', text)  Calibri 15pt bold C_TEXT
    # ('I', text)  Calibri 14pt italic C_ORANGE (sky blue)
    # ('H', text)  Cambria 20pt bold C_HEADER
    # ('C', text)  code block
    # ('S', text)  Calibri 12pt C_MUTED
    # ('BL','')    blank spacer

content_slide(prs, label, title, k8s=False)   # blue or teal header band
section_divider(prs, label, title, subtitle, subtopics, page, k8s=False)
lab_header_slide(prs, lab_num, title, scenario, page, k8s=False)
two_column_slide(prs, label, title, left_heading, left_lines,
                 right_heading, right_lines, page, k8s=False)
kc_note(slide, scenario_path, y)
```

## STEP 4 — Updating or adding a slide
1. Find the correct function in `build_courseware_v3.py`
2. Use `add_body_lines()` with appropriate type codes
3. Run `python build_courseware_v3.py` to regenerate
4. Verify slide count is within target range (~130–145)

## Rules
- No bullets — `_no_bullet()` called on every paragraph by add_body_lines
- Footer on EVERY slide — `add_footer(slide, p)`, use `dark=True` on dark slides
- Every lab slide must call `kc_note(slide, scenario)` for the KillerCoda URL
- Docker content slides use `k8s=False` (default), K8s slides use `k8s=True`
- Concept explanation slides before EVERY lab section (official docs content)
