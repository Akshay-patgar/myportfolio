# Akshay Patgar — Portfolio

A cross-platform personal portfolio built with **Flutter**, showcasing experience, projects, skills, certifications, and contact details. Designed as a dark, developer-themed single-page site with smooth scroll-reveal animations.

Live at: https://akshay-patgar.github.io/myportfolio/

## Table of Contents

- [Features](#features)
- [Project structure](#project-structure)
- [Getting started](#getting-started)
- [Content](#content)
- [Deployment](#deployment)
- [Branch workflow](#branch-workflow)

## Features

- Fully responsive single-page layout (desktop / tablet / mobile)
- Animated hero with rotating ring and profile photo
- About, experience, projects, skills, certifications, education, and contact sections
- Count-up stats, typing roles, and scroll-reveal animations
- Offline-first and real-time tech highlights
- Automatic deploy to GitHub Pages via GitHub Actions

## Project structure

```
lib/
├── main.dart              # App entry point
├── app.dart               # MaterialApp + theme wiring
├── home_screen.dart       # Scroll controller + section navigation
├── core/                  # Theme colors, theme, launch helper
├── data/                  # portfolio_data.dart (all site content)
├── sections/              # hero, about, experience, projects, skills,
│                          #   certifications, education, contact, footer
└── widgets/              # Reusable widgets (nav, common)
web/                       # Flutter web entry (index.html etc.)
.github/workflows/         # GitHub Actions deploy workflow
```

## Getting started

Prerequisites: [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable).

```bash
flutter pub get
flutter run -d chrome        # run locally
```

To verify static analysis:

```bash
flutter analyze
```

## Content

All site content (name, summary, experience, projects, skills, certifications, education, contact links) lives in one file:

```
lib/data/portfolio_data.dart
```

Edit values there — no code changes needed for content updates. The resume PDF (e.g. `Akshay Patgar Flutter developer.pdf`) is **not** committed to git (see `.gitignore`).

## Deployment

The site is hosted on **GitHub Pages** and deployed automatically from the `main` branch.

The workflow `.github/workflows/gh-pages.yml` runs on every push to `main`:

1. Checks out the repo
2. Installs Flutter (stable)
3. Builds the web app with `--base-href=/myportfolio/` (matches the Pages sub-path)
4. Uploads `build/web` as a Pages artifact and deploys it

**One-time setup (already required):** In **Repo → Settings → Pages**, set **Build and deployment → Source** to **`GitHub Actions`**.

There is **no manual build commit** — build output (`/build/`) is git-ignored and produced by CI.

## Branch workflow

- **`dev`** — active development and testing branch (commit changes here).
- **`main`** — deployment branch. Pushing to `main` triggers the deploy.

To ship changes:

```bash
git checkout main
git merge dev
git push origin main
```

GitHub Actions then builds and publishes the latest source automatically. Preview locally on `dev` with `flutter run -d chrome` before merging.
