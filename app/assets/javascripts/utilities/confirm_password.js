document.addEventListener('turbolinks:load', function() {
    var confirm_password = document.getElementById('user_password_confirmation');
    if (confirm_password) { confirm_password.addEventListener('input', assert_passwords) }
});

function assert_passwords(){
    var password = document.getElementById('user_password').value;
    var pass_confirm = this.value;

    if (password.length > 0 && pass_confirm.length > 0) {
        if (password === pass_confirm) {
            document.querySelector('.octicon-check').classList.remove('hide');
            document.querySelector('.octicon-x').classList.add('hide')
        } else {
            document.querySelector('.octicon-check').classList.add('hide');
            document.querySelector('.octicon-x').classList.remove('hide')
        }
    } else {
        document.querySelector('.octicon-check').classList.add('hide');
        document.querySelector('.octicon-x').classList.add('hide')
    }
}