# MeinBlog

A simple, accessible developer blog built with Hugo.

## Features

- 📝 Clean, minimal design
- 🌍 Multi-language support (English & German)
- ♿ WCAG 2.1 AA accessibility compliant
- 🏷️ Categories and tags for easy navigation
- 📱 Responsive design
- 🚀 Fast static site generation with Hugo

## Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) (latest version recommended)
- Git (for version control)

## Quick Start

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd MeinBlock
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
- **Languages**: English and German are pre-configured
- **Social links**: Add your GitHub and LinkedIn URLs:

```toml
[params]
  github = "https://github.com/yourusername"
  linkedin = "https://linkedin.com/in/yourprofile"
```

Leave empty to hide a social link.

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
categories: ["Development", "Web"]
tags: ["Hugo", "Blogging"]
---

Your content here...
```

**Draft vs Published:**
- `draft: true` - Post is hidden from the live site (use for work-in-progress)
- `draft: false` or no draft field - Post is published and visible

To preview drafts locally, use `hugo server -D`

### Editing the About Page

Edit `site/content/about.md` to update your bio and information.

Add a profile image:
1. Place your image in `site/static/assets/images/`
2. Update the front matter in `about.md`:

```yaml
---
image: "/assets/images/profile.jpg"
imageAlt: "Your descriptive alt text"
---
```

## Project Structure

```
site/
├── config.toml          # Site configuration
├── content/             # All content (Markdown)
│   ├── posts/           # Blog posts
│   └── about.md         # About page
├── layouts/             # HTML templates
│   ├── _default/        # Default layouts
│   ├── partials/        # Reusable components
│   └── about/           # About page layout
├── static/              # Static assets
│   └── assets/          # CSS, images
└── i18n/                # Translations (EN/DE)
```

## Multi-Language Support

The blog supports English (default) and German.

- Translation files: `site/i18n/en.toml` and `site/i18n/de.toml`
- Language switcher is automatically shown when content is translated
- To add a German version of a post, create it in the same location with `.de.md` extension

## Accessibility

This blog meets WCAG 2.1 AA standards:
- Semantic HTML
- ARIA labels
- Skip navigation link
- Keyboard navigation
- Sufficient color contrast

## Testing

Run the site locally and verify:

```bash
cd site
hugo server
```

### Manual Tests

Test documentation is available in `specs/dev-blog/tests/`:
- `US1-view-posts-test.md` - Blog post listing
- `US2-about-page-test.md` - About page
- `US3-categories-tags-test.md` - Categories and tags
- `US4-US5-social-links-test.md` - Social links

### Accessibility Testing

Use [Lighthouse](https://developer.chrome.com/docs/lighthouse/) or [axe DevTools](https://www.deque.com/axe/devtools/) to verify WCAG 2.1 AA compliance.

## Deployment

Build the production site:

```bash
cd site
hugo --minify
```

Deploy the `public/` folder to any static hosting service:
- GitHub Pages
- Netlify
- Vercel
- Cloudflare Pages

## License

[Add your license here]

## Contact

- GitHub: [Add your GitHub URL in config.toml]
- LinkedIn: [Add your LinkedIn URL in config.toml]
