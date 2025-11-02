document.addEventListener('DOMContentLoaded', function() {
    // Auto-detect browser language and redirect if needed
    function detectAndRedirectLanguage() {
        const currentPath = window.location.pathname;
        const browserLang = navigator.language || navigator.userLanguage;
        const langCode = browserLang.split('-')[0]; // Get 'de' from 'de-DE' or 'en' from 'en-US'

        // Only redirect if we're on the root path (not already on a language-specific page)
        // and not on /de/ or /en/ paths
        if (currentPath === '/' || currentPath === '/index.html') {
            const supportedLangs = ['de', 'en'];
            const targetLang = supportedLangs.includes(langCode) ? langCode : 'de'; // Default to 'de'

            // Check if user has already visited (don't redirect on every visit)
            const hasVisited = sessionStorage.getItem('language-detected');

            if (!hasVisited) {
                sessionStorage.setItem('language-detected', 'true');
                window.location.href = '/' + targetLang + '/';
            }
        }
    }

    // Run language detection
    detectAndRedirectLanguage();

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
