# Test: User Story 4 & 5 - GitHub and LinkedIn Profile Links

## Test Date
2025-10-17

## Test Objective
Verify that GitHub and LinkedIn profile links are displayed correctly, open in new tabs, and are hidden when not configured.

## Test Steps

### Test 1: GitHub Link is Displayed (When Configured)
1. Add GitHub URL to site/config.toml: `github = "https://github.com/yourusername"`
2. Rebuild the site
3. Navigate to any page
4. Verify GitHub link appears in the footer

**Expected Result**: GitHub link is visible in the footer.

### Test 2: GitHub Link Opens Correctly
1. Click on the GitHub link
2. Verify it opens in a new tab (target="_blank")
3. Verify it navigates to the correct GitHub profile

**Expected Result**: Link opens in new tab with correct URL and rel="noopener noreferrer".

### Test 3: GitHub Link is Hidden (When Not Configured)
1. Remove or leave empty the GitHub URL in config.toml: `github = ""`
2. Rebuild the site
3. Navigate to any page
4. Verify GitHub link is NOT shown in the footer

**Expected Result**: No GitHub link visible when not configured.

### Test 4: LinkedIn Link is Displayed (When Configured)
1. Add LinkedIn URL to site/config.toml: `linkedin = "https://linkedin.com/in/yourprofile"`
2. Rebuild the site
3. Navigate to any page
4. Verify LinkedIn link appears in the footer

**Expected Result**: LinkedIn link is visible in the footer.

### Test 5: LinkedIn Link Opens Correctly
1. Click on the LinkedIn link
2. Verify it opens in a new tab (target="_blank")
3. Verify it navigates to the correct LinkedIn profile

**Expected Result**: Link opens in new tab with correct URL and rel="noopener noreferrer".

### Test 6: LinkedIn Link is Hidden (When Not Configured)
1. Remove or leave empty the LinkedIn URL in config.toml: `linkedin = ""`
2. Rebuild the site
3. Navigate to any page
4. Verify LinkedIn link is NOT shown in the footer

**Expected Result**: No LinkedIn link visible when not configured.

### Test 7: Both Links Work Together
1. Configure both GitHub and LinkedIn URLs in config.toml
2. Rebuild the site
3. Verify both links appear in the footer
4. Verify both links work correctly

**Expected Result**: Both links visible and functional when configured.

### Test 8: Accessibility Check
1. Inspect the social links HTML
2. Verify each link has proper aria-label
3. Verify target="_blank" has rel="noopener noreferrer" for security

**Expected Result**: Links meet WCAG 2.1 AA accessibility standards.

## Manual Test Execution

```bash
cd /d/Projects/MeinBlock/site
# Edit config.toml to add your GitHub/LinkedIn URLs
hugo server
# Visit http://localhost:1313
# Check footer for social links
```

## Test Status
- [ ] Test 1: GitHub link displayed - PENDING
- [ ] Test 2: GitHub link opens correctly - PENDING
- [ ] Test 3: GitHub link hidden when empty - PENDING
- [ ] Test 4: LinkedIn link displayed - PENDING
- [ ] Test 5: LinkedIn link opens correctly - PENDING
- [ ] Test 6: LinkedIn link hidden when empty - PENDING
- [ ] Test 7: Both links together - PENDING
- [ ] Test 8: Accessibility - PENDING

## Notes
- Add your actual GitHub and LinkedIn URLs to config.toml
- Verify links in both English and German versions
- Check that security attributes (rel="noopener noreferrer") are present

