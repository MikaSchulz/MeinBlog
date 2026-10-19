// Info buttons ({{< info >}} shortcode): a click or tap toggles the explanation;
// Escape or a click elsewhere closes it. On wide screens with a mouse, CSS also
// shows it on hover; Escape hides that too until the mouse leaves.
document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.info-button');
    if (!buttons.length) return;

    function closeAll(except) {
        buttons.forEach(function(button) {
            if (button !== except) button.setAttribute('aria-expanded', 'false');
        });
    }

    buttons.forEach(function(button) {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const isOpen = button.getAttribute('aria-expanded') === 'true';
            closeAll(button);
            button.setAttribute('aria-expanded', String(!isOpen));
        });

        const info = button.closest('.info');
        info.addEventListener('mouseleave', function() {
            info.classList.remove('is-dismissed');
        });
    });

    // Clicks inside an open popup (e.g. selecting text) keep it open
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.info')) closeAll(null);
    });

    document.addEventListener('keydown', function(e) {
        if (e.key !== 'Escape') return;
        const open = document.querySelector('.info-button[aria-expanded="true"]');
        closeAll(null);
        document.querySelectorAll('.info:hover').forEach(function(info) {
            info.classList.add('is-dismissed');
        });
        if (open) open.focus();
    });
});
