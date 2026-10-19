// Enlarged images (figure shortcode): a click on an image shows it in a dialog that fills the
// screen. The close button, Escape or a click outside the caption closes it, and the focus goes
// back to the image. Without JavaScript (or with Ctrl/Cmd/Shift click), the link opens the image file.
document.addEventListener('DOMContentLoaded', function() {
    const dialog = document.querySelector('.lightbox');
    if (!dialog || typeof dialog.showModal !== 'function') return;

    const figure = dialog.querySelector('.lightbox-figure');
    let opener = null;

    document.querySelectorAll('.zoom-link').forEach(function(link) {
        link.setAttribute('aria-haspopup', 'dialog');
        link.addEventListener('click', function(e) {
            if (e.ctrlKey || e.metaKey || e.shiftKey || e.altKey) return;
            e.preventDefault();

            const image = document.createElement('img');
            image.src = link.href;
            image.alt = link.querySelector('img').alt;
            const content = [image];
            const caption = link.closest('figure').querySelector('figcaption');
            if (caption) content.push(caption.cloneNode(true));
            figure.replaceChildren.apply(figure, content);

            opener = link;
            dialog.showModal();
        });
    });

    // Clicks on the caption (e.g. selecting text) keep the dialog open
    dialog.addEventListener('click', function(e) {
        if (!e.target.closest('figcaption')) dialog.close();
    });

    dialog.addEventListener('close', function() {
        if (opener) opener.focus();
    });
});
