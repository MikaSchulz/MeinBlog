#!/usr/bin/env bash
# Automated smoke tests for the blog (constitution principle III).
#
# Builds the site into a temporary directory and checks the user stories from
# specs/dev-blog/spec.md plus a few accessibility and link basics.
#
# Usage:
#   tests/smoke-test.sh                       # uses `hugo` from PATH
#   HUGO=/path/to/hugo tests/smoke-test.sh    # uses a specific Hugo binary

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HUGO="${HUGO:-hugo}"
TMP="$(mktemp -d)"
OUT="$TMP/public"
trap 'rm -rf "$TMP"' EXIT

failures=0

pass() { echo "  ok    $1"; }
fail() { echo "  FAIL  $1"; failures=$((failures + 1)); }

# contains FILE REGEX DESCRIPTION
contains() {
    if [ -f "$OUT/$1" ] && grep -Eq -- "$2" "$OUT/$1"; then pass "$3"; else fail "$3 ($1 does not match '$2')"; fi
}

# not_contains FILE REGEX DESCRIPTION
not_contains() {
    if [ -f "$OUT/$1" ] && ! grep -Eq -- "$2" "$OUT/$1"; then pass "$3"; else fail "$3 ($1 matches '$2' or is missing)"; fi
}

# exists FILE DESCRIPTION
exists() {
    if [ -f "$OUT/$1" ]; then pass "$2"; else fail "$2 ($1 is missing)"; fi
}

# not_exists FILE DESCRIPTION
not_exists() {
    if [ ! -e "$OUT/$1" ]; then pass "$2"; else fail "$2 ($1 should not exist)"; fi
}

echo "Building site with $("$HUGO" version | cut -d' ' -f1-2) ..."
# Warnings (e.g. missing translations, unchecked color contrast) fail the build.
if ! "$HUGO" --source "$ROOT/site" --destination "$OUT" --baseURL "/" \
    --printI18nWarnings --panicOnWarning > "$TMP/build.log" 2>&1; then
    cat "$TMP/build.log"
    echo "FAIL  Hugo build (missing translation, invalid color, insufficient contrast, ...)"
    exit 1
fi
pass "Hugo build without warnings (translations complete, colors valid, contrast WCAG AA)"

echo "US1 - View all blog posts"
contains index.html 'Mein erster Blogbeitrag' "German home page lists published posts"
contains en/index.html 'My First Blog Post' "English home page lists published posts"
contains posts/index.html 'Mein erster Blogbeitrag' "Blog page lists published posts"
not_exists posts/draft-post/index.html "Draft posts are not rendered"
not_contains index.html 'Draft Post' "Draft posts are not listed"
contains index.html '17\. Oktober 2025' "Dates are localized (German)"
contains en/index.html 'October 17, 2025' "Dates are localized (English)"

echo "US2 - About page"
contains about/index.html '<h1' "German about page renders"
contains en/about/index.html '<h1' "English about page renders"
contains index.html 'href="/about/"' "Navigation links to the German about page"
contains en/index.html 'href="/en/about/"' "Navigation links to the English about page"

echo "US3 - Categories and tags"
contains posts/first-post/index.html 'href="/categories/development/"' "Post page links its categories"
contains posts/first-post/index.html 'href="/tags/hugo/"' "Post page links its tags"
contains posts/first-post/index.html '<time datetime=' "Post page shows its date"
contains categories/development/index.html 'Mein erster Blogbeitrag' "Category page lists matching posts"
contains tags/hugo/index.html 'Mein erster Blogbeitrag' "Tag page lists matching posts"
contains en/tags/hugo/index.html 'My First Blog Post' "English tag page lists matching posts"

echo "US4/US5 - Profile links"
contains index.html 'href="https://github.com/[^"]+" target="_blank" rel="noopener noreferrer"' "GitHub link opens in a new tab"
contains index.html 'href="https://www.linkedin.com/[^"]+" target="_blank" rel="noopener noreferrer"' "LinkedIn link opens in a new tab"

echo "Localization"
contains index.html '<html lang="de"' "German pages declare lang=de"
contains en/index.html '<html lang="en"' "English pages declare lang=en"
exists 404.html "German 404 page exists (used by nginx)"
exists en/404.html "English 404 page exists"
not_exists index.xml "No RSS feed (out of scope)"

echo "Accessibility and links"
html_files=$(cd "$OUT" && find . -name '*.html' ! -path './de/*' | sed 's|^\./||' | sort)
missing_skip=0; img_without_alt=0; empty_headings=0; wrong_h1=0
for f in $html_files; do
    grep -q 'class="skip-link"' "$OUT/$f" || { echo "        no skip link: $f"; missing_skip=1; }
    if grep -o '<img[^>]*>' "$OUT/$f" | grep -vq 'alt="[^"]'; then echo "        image without alt text: $f"; img_without_alt=1; fi
    if grep -Eq '<h[1-6][^>]*>[[:space:]]*</h[1-6]>' "$OUT/$f"; then echo "        empty heading: $f"; empty_headings=1; fi
    h1_count=$(grep -o '<h1[ >]' "$OUT/$f" | wc -l | tr -d ' ')
    [ "$h1_count" -eq 1 ] || { echo "        $h1_count <h1> headings (expected 1): $f"; wrong_h1=1; }
done
[ $missing_skip -eq 0 ] && pass "Every page has a skip link" || fail "Every page has a skip link"
[ $img_without_alt -eq 0 ] && pass "Every image has alt text" || fail "Every image has alt text"
[ $empty_headings -eq 0 ] && pass "No empty headings" || fail "No empty headings"
[ $wrong_h1 -eq 0 ] && pass "Every page has exactly one <h1>" || fail "Every page has exactly one <h1>"

broken_links=0
for target in $(cd "$OUT" && grep -ohE '(href|src)="/[^/"][^"]*"|(href|src)="/"' $html_files | sed -E 's/^(href|src)="//; s/"$//; s/[#?].*$//' | sort -u); do
    path="$OUT$target"
    [ -d "$path" ] && path="$path/index.html"
    [ -f "$path" ] || { echo "        broken link: $target"; broken_links=1; }
done
[ $broken_links -eq 0 ] && pass "All internal links and assets resolve" || fail "All internal links and assets resolve"

echo
if [ $failures -gt 0 ]; then
    echo "$failures check(s) failed."
    exit 1
fi
echo "All checks passed."
