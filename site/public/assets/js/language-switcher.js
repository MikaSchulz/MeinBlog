document.addEventListener('DOMContentLoaded', function() {
    const dropdown = document.querySelector('.language-switcher-dropdown');
    if (!dropdown) return;

    const button = dropdown.querySelector('.language-switcher-button');
    const menu = dropdown.querySelector('.language-switcher-menu');

    button.addEventListener('click', function(e) {
        e.stopPropagation();
        const isExpanded = button.getAttribute('aria-expanded') === 'true';
        button.setAttribute('aria-expanded', !isExpanded);
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

