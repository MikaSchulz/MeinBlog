# MeinBlog

A simple, accessible developer blog built with Hugo. Live at [eyetealer.me](https://eyetealer.me).

## Features

- 📝 Clean, minimal design
- 🌍 Multi-language support (German & English)
- ♿ WCAG 2.1 AA accessibility compliant
- 🏷️ Categories and tags, browsable on the topics page
- 📱 Responsive design
- 🚀 Fast static site generation with Hugo

## Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) 0.139.3 (the version used by the Dockerfile and CI)
- Git (for version control)
- Bash (on Windows: Git Bash)

## Quick Start

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd MeinBlog
```

### 2. Run the development server

```bash
cd site
hugo server -D
```

The site will be available at `http://localhost:1313`

### 3. Build for production

```bash
cd site
hugo
```

The built site will be in `site/public/`

## Configuration

### Site Settings

Edit `site/config.toml` to customize:

- **Site title and description**: Update `title` and `params.description`
- **Author name**: Update `params.author`
- **Languages**: German (default) and English are pre-configured
- **Social links**: Add your GitHub and LinkedIn URLs:

```toml
[params]
  github = "https://github.com/yourusername"
  linkedin = "https://linkedin.com/in/yourprofile"
```

Leave empty to hide a social link.

### Colors

All colors are configured in the `[params.colors]` section of `site/config.toml`. Any color you leave out falls back to the defaults in `site/data/color_defaults.toml`.

Accepted formats: hexadecimal (`#RRGGBB`, `#RGB`), `rgb(r,g,b)` / `rgba(r,g,b,a)` and common CSS color names (`white`, `navy`, ...).

The build validates the colors and fails with an error if:

- a value has an invalid format, or
- a text color has a contrast ratio below **4.5:1** (WCAG 2.1 AA) against its background:
  - `text`, `link`, `linkHover`, `headingPrimary`, `headingSecondary`, `metadata` on `background`
  - `codeText` on `codeBackground`
  - `navigationLink` on `headerBackground`
  - `background` on `button` (badges use the page background as text color)

Semi-transparent `rgba()` colors cannot be checked automatically and produce a warning.

## Creating Content

### Writing Blog Posts

Create a new post:

```bash
cd site
hugo new posts/my-new-post.md
```

Edit the front matter:

```yaml
---
title: "My New Post"
date: 2025-10-17T10:00:00+01:00
draft: false  # Set to true to hide from live site
description: "Short teaser shown in the post list"  # optional
categories: ["Development", "Web"]
tags: ["Hugo", "Blogging"]
---

Your content here...
```

**Categories and tags:**
- Exactly one category per post: `AI`, `Homelab`, `Smart Home`, `Maker` or `Misc`.
- Any number of tags: lowercase English keywords such as `fun`, `diy`, `home-assistant`. Use the same names in German and English posts so the URLs stay the same.
- All categories and tags are listed on the topics page (`/themen/`, English `/en/topics/`), linked in the navigation. Tags are shown with a decorative `#`.

The teaser in the post lists is the `description`. Without one, Hugo uses the text before a `<!--more-->` line, or else the beginning of the post.

Start headings in posts with `##`: the post title is already the page's only `<h1>`.

**Draft vs Published:**
- `draft: true` - Post is hidden from the live site (use for work-in-progress)
- `draft: false` or no draft field - Post is published and visible

To preview drafts locally, use `hugo server -D`

### Editing the Home and About Pages

- Home page: `site/content/_index.md` (German) and `site/content/_index.en.md` (English). The profile photo next to the intro is set with `image` (and optionally `imageAlt`) in their front matter.
- About page: `site/content/about.md` and `site/content/about.en.md`.
- Topics page: intro text in `site/content/topics.md` and `site/content/topics.en.md`; the lists of categories and tags are generated.

Images live in `site/static/assets/images/`. Resize photos before adding them (the home page shows the profile photo at no more than 250px wide).

## Project Structure

```
site/
├── config.toml          # Site configuration (languages, params, colors)
├── assets/              # CSS and JS (published with a content hash in the file name)
├── content/             # All content (Markdown)
│   ├── posts/           # Blog posts
│   └── about.md         # About page
├── data/                # Color defaults
├── layouts/             # HTML templates
│   ├── _default/        # Default layouts
│   ├── posts/           # Post page layout
│   ├── partials/        # Reusable components
│   └── 404.html         # "Page not found" page
├── static/              # Static files (favicons, images)
│   └── assets/images/   # Images
└── i18n/                # Translations (DE/EN)
tests/
├── smoke-test.sh        # Automated smoke tests
└── fixtures/content/    # Test posts, only added to the test build
specs/                   # Spec Kit specification, plan, tasks and manual tests
```

## Multi-Language Support

The blog supports German (default, served at `/`) and English (served at `/en/`).

- Translation files: `site/i18n/de.toml` and `site/i18n/en.toml`. Every key must exist in both files; the smoke tests fail on missing translations.
- Language switcher is automatically shown in the navigation
- To add an English version of a post, create it in the same location with `.en.md` extension

## Accessibility

This blog meets WCAG 2.1 AA standards:
- Semantic HTML
- ARIA labels
- Skip navigation link
- Keyboard navigation
- Sufficient color contrast (checked at build time, see [Colors](#colors))

## Testing

### Automated Tests

```bash
tests/smoke-test.sh
# or with a specific Hugo binary:
HUGO=/path/to/hugo tests/smoke-test.sh
```

The script builds the site, together with the test posts from `tests/fixtures/content/` (so the checks don't depend on your real posts), and checks the user stories from `specs/dev-blog/spec.md` (post lists, drafts, about page, categories and tags, profile links, both languages) plus accessibility and link basics: complete translations, valid colors with sufficient contrast, one `<h1>` per page, alt text on images, no empty headings and no broken internal links.

The tests run automatically on GitHub Actions for every push to `main` and every pull request (`.github/workflows/test.yml`).

### Manual Tests

Test documentation is available in `specs/dev-blog/tests/`:
- `US1-view-posts-test.md` - Blog post listing
- `US2-about-page-test.md` - About page
- `US3-categories-tags-test.md` - Categories and tags
- `US4-US5-social-links-test.md` - Social links
- `final-phase-testing.md` - Accessibility, language switching, performance

### Accessibility Testing

Use [Lighthouse](https://developer.chrome.com/docs/lighthouse/) or [axe DevTools](https://www.deque.com/axe/devtools/) to verify WCAG 2.1 AA compliance.

## Deployment

The site is deployed as a Docker image built from the `Dockerfile`:

1. **Build stage:** `hugomods/hugo:0.139.3` builds the minified site from `site/`.
2. **Runtime stage:** `nginx:1.27-alpine` serves the static files (long cache for assets, clean URLs, custom 404 page) with a healthcheck.

A self-hosted [Dokploy](https://dokploy.com) instance rebuilds and redeploys the image automatically on every push to `main` (GitHub webhook via Cloudflare Tunnel).

Build the image locally:

```bash
docker build -t eyetealer/hugo-meinblog:latest .
```

The base URL defaults to `https://eyetealer.me/` and can be overridden with `--build-arg HUGO_BASEURL=...`.

## License

[Add your license here]

## Contact

- GitHub: [MikaSchulz](https://github.com/MikaSchulz)
- LinkedIn: [Mika Schulz](https://www.linkedin.com/in/mika-schulz-538b5a246/)
