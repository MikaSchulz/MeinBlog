# Final Phase Testing Guide

## Test Date
2025-10-17

## Purpose
This guide covers all cross-cutting concerns and polish tasks for the dev blog project.

---

## T028: Accessibility Testing (WCAG 2.1 AA)

### Objective
Verify the blog meets WCAG 2.1 AA accessibility standards in both English and German.

### Tools Required
- [Lighthouse](https://developer.chrome.com/docs/lighthouse/) (built into Chrome DevTools)
- [axe DevTools](https://www.deque.com/axe/devtools/) (browser extension)

### Test Steps

#### 1. Lighthouse Accessibility Audit (English)
```bash
cd site
hugo server
```
1. Open Chrome and navigate to `http://localhost:1313`
2. Open DevTools (F12)
3. Go to "Lighthouse" tab
4. Select "Accessibility" category
5. Click "Analyze page load"
6. Verify score is 90+ (WCAG 2.1 AA compliance)

**Expected Result**: Accessibility score ≥ 90

#### 2. Lighthouse Accessibility Audit (German)
1. Switch to German using language switcher
2. Repeat Lighthouse audit
3. Verify score is 90+ in German version

**Expected Result**: Accessibility score ≥ 90 in German

#### 3. axe DevTools Scan
1. Install axe DevTools extension
2. Navigate to main page
3. Run axe scan
4. Verify no critical or serious issues
5. Repeat for About page, post pages, category/tag pages

**Expected Result**: No critical or serious accessibility violations

#### 4. Keyboard Navigation Test
1. Navigate using Tab key only
2. Verify skip link appears on focus
3. Verify all interactive elements are reachable
4. Verify focus indicators are visible

**Expected Result**: Full keyboard navigation works

#### 5. Screen Reader Test (Optional)
1. Enable screen reader (NVDA, JAWS, or VoiceOver)
2. Navigate through the site
3. Verify ARIA labels are announced correctly
4. Verify all content is accessible

**Expected Result**: Screen reader can access all content

---

## T029: Language Switching Test

### Objective
Verify language switching works correctly and all UI text is translated.

### Test Steps

#### 1. Language Switcher Visibility
1. Navigate to main page
2. Verify language switcher is visible in navigation
3. Verify both "English" and "Deutsch" options are shown

**Expected Result**: Language switcher is visible and functional

#### 2. Switch to German
1. Click "Deutsch" in language switcher
2. Verify page reloads in German
3. Verify URL reflects language (if applicable)

**Expected Result**: Page switches to German

#### 3. Verify German Translations
Check all UI elements are translated:
- [ ] Navigation: "Startseite", "Über mich"
- [ ] Posts page: "Beiträge", "Veröffentlicht am", "Weiterlesen"
- [ ] Empty state: "Noch keine Beiträge verfügbar."
- [ ] Categories: "Kategorien"
- [ ] Tags: "Schlagwörter"
- [ ] Skip link: "Zum Hauptinhalt springen"

**Expected Result**: All UI text is properly translated

#### 4. Switch Back to English
1. Click "English" in language switcher
2. Verify page reloads in English
3. Verify all text is back in English

**Expected Result**: Language switching works bidirectionally

#### 5. Test All Pages in Both Languages
Test language switching on:
- [ ] Main page (posts list)
- [ ] About page
- [ ] Individual post pages
- [ ] Category pages
- [ ] Tag pages

**Expected Result**: All pages work correctly in both languages

---

## T030: Performance Optimization

### Objective
Verify site performance meets Lighthouse score >90

### Test Steps

#### 1. Lighthouse Performance Audit
```bash
cd site
hugo --minify  # Build optimized version
hugo server
```
1. Open Chrome DevTools
2. Run Lighthouse performance audit
3. Verify Performance score >90

**Expected Result**: Performance score >90

#### 2. Check Metrics
Verify specific metrics:
- First Contentful Paint (FCP) < 1.8s
- Largest Contentful Paint (LCP) < 2.5s
- Total Blocking Time (TBT) < 200ms
- Cumulative Layout Shift (CLS) < 0.1

**Expected Result**: All Core Web Vitals in "Good" range

#### 3. CSS Optimization
1. Verify main.css is loaded
2. Check for unused CSS (optional)
3. Verify no render-blocking resources

**Expected Result**: CSS is optimized and minimal

#### 4. Image Optimization
1. Add test images to site/static/assets/images/
2. Verify images have appropriate sizes
3. Verify alt text is present
4. Consider using WebP format (optional)

**Expected Result**: Images are optimized with proper alt text

---

## T032: Draft Post Workflow Test

### Objective
Verify draft posts are hidden from live site

### Test Steps

#### 1. Verify Draft Post Exists
1. Check `site/content/posts/draft-post.md` exists
2. Verify front matter has `draft: true`

**Expected Result**: Draft post file exists with draft: true

#### 2. Test Without Draft Flag
```bash
cd site
hugo server
```
1. Navigate to main page
2. Verify "Draft Post - Work in Progress" is NOT visible
3. Try to access the draft post URL directly
4. Verify it returns 404 or is not accessible

**Expected Result**: Draft post is NOT visible on live site

#### 3. Test With Draft Flag
```bash
hugo server -D
```
1. Navigate to main page
2. Verify "Draft Post - Work in Progress" IS visible
3. Verify it can be accessed

**Expected Result**: Draft post IS visible with -D flag

#### 4. Test in Production Build
```bash
hugo --minify
# Serve the public/ folder
```
1. Verify draft post is NOT included in public/ folder
2. Verify only published posts are in output

**Expected Result**: Draft posts excluded from production build

#### 5. Test Draft in Categories/Tags
1. Add draft: true post with categories/tags
2. Visit those category/tag pages
3. Verify draft is NOT listed

**Expected Result**: Draft posts excluded from taxonomy pages

---

## Summary Checklist

- [ ] T028: Accessibility (WCAG 2.1 AA) - English and German
- [ ] T029: Language switching works correctly
- [ ] T030: Performance score >90
- [ ] T032: Draft workflow verified

## Notes
- Run all tests before final deployment
- Document any issues found
- Re-test after fixes

