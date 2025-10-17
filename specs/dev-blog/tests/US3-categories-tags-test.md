# Test: User Story 3 - Categories and Tags

## Test Date
2025-10-17

## Test Objective
Verify that filtering and browsing by category or tag works correctly in both English and German.

## Test Steps

### Test 1: Category Navigation Works
1. Navigate to a blog post (e.g., "My First Blog Post")
2. Verify categories are displayed below the post
3. Click on a category link (e.g., "Development")
4. Verify that only posts in that category are shown

**Expected Result**: Category filter page displays only posts tagged with that category.

### Test 2: Tag Navigation Works
1. Navigate to a blog post (e.g., "Understanding Hugo Static Sites")
2. Verify tags are displayed below the post
3. Click on a tag link (e.g., "Hugo")
4. Verify that only posts with that tag are shown

**Expected Result**: Tag filter page displays only posts tagged with that tag.

### Test 3: Categories Overview Page
1. Navigate to /categories
2. Verify all categories are listed
3. Verify post count is shown for each category

**Expected Result**: Categories overview shows all categories with post counts.

### Test 4: Tags Overview Page
1. Navigate to /tags
2. Verify all tags are listed
3. Verify post count is shown for each tag

**Expected Result**: Tags overview shows all tags with post counts.

### Test 5: Multi-Language Support
1. Navigate to /categories (English)
2. Switch to German using language switcher
3. Verify categories page works in German
4. Repeat for tags page

**Expected Result**: Category and tag filtering works in both languages.

### Test 6: Draft Posts Are Excluded
1. Add a draft post with categories/tags
2. Navigate to those category/tag pages
3. Verify draft post is NOT shown in the filtered results

**Expected Result**: Draft posts are excluded from category/tag listings.

## Manual Test Execution

```bash
cd /d/Projects/MeinBlock/site
hugo server
# Visit http://localhost:1313
# Click on categories/tags in posts
# Test filtering functionality
```

## Test Status
- [ ] Test 1: Category navigation - PENDING
- [ ] Test 2: Tag navigation - PENDING
- [ ] Test 3: Categories overview - PENDING
- [ ] Test 4: Tags overview - PENDING
- [ ] Test 5: Multi-language - PENDING
- [ ] Test 6: Draft exclusion - PENDING

## Notes
- Verify translations are correct in both EN and DE
- Check ARIA labels for accessibility
- Ensure post counts are accurate

