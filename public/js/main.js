(function($, window){

$(function(){
    console.log('ready!');
    if (typeof APP === 'undefined') {
        APP = {};
    }

    extendValidationMethods();

    if (!APP.userLogged) {
        showAuthModal();
    }
});

function logout() {

}

function extendValidationMethods() {
    jQuery.validator.addMethod('passwordNormal', function(value, element){
        return this.optional(element) || /^[a-zA-Z0-9!@#$%^&*()_+\-=;:]{8,32}$/.test(value);
    }, 'Password must contain latin letters, numbers and !@#$%^&*()_+-=;: characters only.');

    jQuery.validator.addMethod('nameNormal', function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9_\- а-яА-ЯёЁ]{3,}$/.test(value);
    }, 'Please, provide a real name. Words combined with Latin or Russian letters, numbers and underscore only.');
}

function showAuthModal() {
    $('#auth-modal').modal('show');
    $('#auth-form').validate({
        rules: {
            email: {
                required: true
            },
            password: {
                required: true
            }
        },
        messages: {
            email: {
                required: 'Please, enter your e-mail'
            },
            password: {
                required: 'Please, enter your password'
            }
        }
    });

    $('#reg-form').validate({
        rules: {
            name: {
                required: true,
                minlength: 3,
                nameNormal: true
            },
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 8,
                passwordNormal: true
            },
            password_confirmation: {
                required: true,
                equalTo: '#password'
            }
        },
        messages: {
            name: {
                required: 'Please, enter your Name.',
                minlength: 'Name should be 3 symbols length min.',
            },
            email: {
                required: 'Please, enter your e-mail.',
                email: 'Not a valid e-mail.'
            },
            password: {
                required: 'Please, provide a password.',
                minlength: 'You password must be at least 8 characters long.'
            },
            password_confirmation: {
                required: 'Please, repeat the password.',
                minlength: 'You password must be at least 8 characters long.',
                equalTo: 'Please, enter the same password as above.'
            }
        }
    });
}

})(jQuery, window)
