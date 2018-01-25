document.addEventListener('turbolinks:load', function () {
    var controls = document.querySelectorAll('.form-inline-link');

    if (controls.length) {
        for (var i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }
});

function formInlineLinkHandler(event) {
    event.preventDefault();
    var testId = this.dataset.testId;
    formInlineHandler(testId);
};

function formInlineHandler(testId) {
    var link = document.quesrySelector('.form-inline-link[data-test-id="' + testId + '"]');
    var testTitle = document.quesrySelector('.test-title[data-test-id="' + testId + '"]');
    var formInline = document.quesrySelector('.form-inline[data-test-id="' + testId + '"]');

    if(formInline.classList.contains('hide')) {
        testTitle.classList.add('hide');
        formInline.classList.remove('hide');
        link.textContent = 'Cancel';
    } else {
        testTitle.classList.remove('hide');
        formInline.classList.add('hide');
        link.textContent = 'Edit';
    }
}
