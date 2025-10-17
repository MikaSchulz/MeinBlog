# Test: User Story 1 - View All Blog Posts

## Test Date
2025-10-17

## Test Objective
Verify that all published posts are listed chronologically on the main page and draft posts are hidden.

## Test Steps

### Test 1: Verify Published Posts Are Displayed
1. Navigate to the main page (/)
2. Verify that "My First Blog Post" is visible
3. Verify that "Understanding Hugo Static Sites" is visible
4. Verify posts are sorted by date (newest first)

**Expected Result**: Both published posts are visible and sorted correctly.

### Test 2: Verify Draft Posts Are Hidden
1. Navigate to the main page (/)
2. Verify that "Draft Post - Work in Progress" is NOT visible

**Expected Result**: Draft post is not shown on the live site.

### Test 3: Verify Empty State
1. Remove all published posts from site/content/posts/
2. Navigate to the main page (/)
3. Verify message "No posts available yet." (EN) or "Noch keine Beiträge verfügbar." (DE) is displayed

**Expected Result**: Empty state message is shown when no posts exist.

## Manual Test Execution

To run this test manually:
```bash
cd /d/Projects/MeinBlock/site
hugo server -D  # Include drafts to verify they appear
hugo server     # Without drafts to verify they're hidden
```

## Test Status
- [ ] Test 1: Published posts displayed - PENDING
- [ ] Test 2: Draft posts hidden - PENDING
- [ ] Test 3: Empty state works - PENDING

## Notes
- Tests should be run in both English and German
- Verify accessibility with screen reader
- Check that ARIA labels are correct

