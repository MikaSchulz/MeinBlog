---
description: |
  Task list for feature implementation: Dev Blog
---

# Tasks: Dev Blog

**Input**: Design documents from `/specs/dev-blog/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

## Phase 1: Setup (Shared Infrastructure)
- [x] T001 Create Hugo site structure in site/
- [x] T002 Add config.toml with English and German language support in site/
- [x] T003 [P] Add i18n/en.toml and i18n/de.toml translation files in site/i18n/
- [x] T004 [P] Add static/assets/ directory for images and CSS in site/static/assets/
- [x] T005 [P] Add content/about.md and content/_index.md in site/content/

## Phase 2: Foundational (Blocking Prerequisites)
- [x] T006 Add base layouts and partials for navigation, header, and footer in site/layouts/
- [x] T007 Add ARIA labels, skip links, and semantic HTML to base templates for WCAG 2.1 AA compliance in site/layouts/_default/
- [x] T008 Add language switcher partial (English/German) and integrate into navigation in site/layouts/partials/
- [x] T009 Add site params for GitHub and LinkedIn links in site/config.toml

## Phase 3: User Story 1 - View All Blog Posts (P1)
- [x] T010 [US1] Add posts/ directory and sample post with draft: false in site/content/posts/
- [x] T011 [US1] Implement main page list of published posts (exclude draft: true) in site/layouts/_default/list.html
- [x] T012 [US1] Add empty state message for no published posts in site/layouts/_default/list.html
- [x] T013 [US1] Add test: verify all published posts are listed chronologically, draft posts are hidden (manual/automated)

## Phase 4: User Story 2 - About Me Page (P2)
- [x] T014 [US2] Implement About Me page layout in site/layouts/about/single.html
- [x] T015 [US2] Add author bio and profile image with alt text in site/content/about.md
- [x] T016 [US2] Add test: verify About Me page displays author info in both English and German (manual/automated)

## Phase 5: User Story 3 - Categories and Tags (P2)
- [x] T017 [US3] Add categories and tags to post front matter in site/content/posts/*.md
- [x] T018 [US3] Implement category/tag navigation with translations in site/layouts/partials/
- [x] T019 [US3] Implement category/tag filter pages in site/layouts/_default/terms.html
- [x] T020 [US3] Add test: verify filtering by category/tag works in both languages (manual/automated)

## Phase 6: User Story 4 - GitHub Profile Link (P3)
- [x] T021 [US4] Add GitHub link to site params in site/config.toml
- [x] T022 [US4] Add GitHub icon/link with conditional rendering (hide if missing) to navigation/footer in site/layouts/partials/
- [x] T023 [US4] Add test: verify GitHub link opens correct profile in new tab (manual/automated)

## Phase 7: User Story 5 - LinkedIn Profile Link (P3)
- [x] T024 [US5] Add LinkedIn link to site params in site/config.toml
- [x] T025 [US5] Add LinkedIn icon/link with conditional rendering (hide if missing) to navigation/footer in site/layouts/partials/
- [x] T026 [US5] Add test: verify LinkedIn link opens correct profile in new tab (manual/automated)

## Final Phase: Polish & Cross-Cutting Concerns
- [x] T027 [P] Add alt text to all images in site/static/assets/ and site/content/
- [x] T028 [P] Test accessibility (WCAG 2.1 AA) with Lighthouse/axe in both English and German
- [x] T029 [P] Test language switching (English ↔ German) and verify all UI text is translated
- [x] T030 [P] Optimize images and CSS for performance (Lighthouse >90)
- [x] T031 [P] Update README with setup, content creation (including draft/publish workflow), and maintenance instructions
- [x] T032 [P] Test draft post workflow: verify draft: true posts are not visible on live site

## Dependencies
- Phase 1 and 2 must be completed before any user story phases
- User stories are independent except About Me (US2) depends on setup
- Polish phase can be done in parallel after all user stories

## Parallel Execution Examples
- T003, T004, T005 can be done in parallel after T001
- T027–T032 can be done in parallel after all user stories

## Implementation Strategy
- MVP: Complete Phase 1–3 (setup, foundational, and main page listing published posts)
- Incremental delivery: Add About Me, categories/tags, GitHub/LinkedIn links, then polish

**Total tasks:** 32
**Task count per user story:**
- US1: 4
- US2: 3
- US3: 4
- US4: 3
- US5: 3
**Parallel opportunities:** 9
**Independent test criteria:** Each user story has a manual/automated test task
**Suggested MVP scope:** Phase 1–3 (setup, foundational, main page listing)
**Format validation:** All tasks follow strict checklist format with IDs, labels, and file paths.

## Key Clarifications from Spec
- Multi-language support: English and German (Deutsch)
- Accessibility: WCAG 2.1 AA or higher
- Draft/Published: Hugo's `draft: true/false` front matter
- Profile links: GitHub and LinkedIn only, hide if missing
