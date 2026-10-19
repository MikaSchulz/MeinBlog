// Language dropdown in the navigation. There is deliberately no automatic redirect
// based on the browser language: search engines crawl with English browsers, and
// the hreflang links in <head> already point to the other language.
document.addEventListener('DOMContentLoaded', function() {
    const dropdown = document.querySelector('.language-switcher-dropdown');
    if (!dropdown) return;

    const button = dropdown.querySelector('.language-switcher-button');
    const menu = dropdown.querySelector('.language-switcher-menu');

    button.addEventListener('click', function(e) {
        e.stopPropagation();
        const isExpanded = button.getAttribute('aria-expanded') === 'true';
        button.setAttribute('aria-expanded', !isExpanded);
        if (!isExpanded) {
            // The menu hangs from the button's right edge. On small screens the button
            // can wrap to the left edge, so the menu would leave the screen: hang it
            // from the left edge instead. The closed menu is only invisible, so it can be measured.
            dropdown.classList.remove('align-left');
            if (menu.getBoundingClientRect().left < 0) {
                dropdown.classList.add('align-left');
            }
        }
        dropdown.classList.toggle('open');
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function(e) {
        if (!dropdown.contains(e.target)) {
            button.setAttribute('aria-expanded', 'false');
            dropdown.classList.remove('open');
        }
    });

    // Close dropdown when pressing Escape
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && dropdown.classList.contains('open')) {
            button.setAttribute('aria-expanded', 'false');
            dropdown.classList.remove('open');
            button.focus();
        }
    });
});
