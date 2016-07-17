(function($, window){

if (typeof APP === 'undefined') {
    APP = {};
}

$(function(){
    console.log('ready!');

    extendValidationMethods();

    if (!APP.userLogged) {
        APP.showAuthModal();
    }
    APP.init();
});

APP.init = function() {
    APP.minSumAmountToSend = 10;
    APP.initUserCombobox();
    APP.initSumAmountSpinner();
};

APP.initSumAmountSpinner = function() {
    $('.js-sum-amount').each(function(){
        var max = parseFloat($(this).data('max'));
        APP.balance = max;
        $(this).spinner({
            min: APP.minSumAmountToSend,
            max: max,
            step: 1,
            start: 10,
            numberFormat: 'C'
        });
    });
}

APP.initUserCombobox = function() {
    $('.js-user-combobox').autocomplete({
        source: '/ajax/users.get',
        minLength: 0,
        select: function(event, ui) {
            $(event.target).data('id', ui.item.id);
        }
    }).on('keyup paste', function(event) {
        if (!(event.type == 'keyup' && event.keyCode == 13)) {
            $(this).data('id', '')
                .closest('.form-group').removeClass('has-error')
                .find('.js-luckyUser-error').addClass('none').html('');
        }
    });

}

APP.sendFunds = function(elem) {
    var $form = $(elem).closest('#sendfunds-form');
    var $user = $form.find('input[name=luckyUser]');
    var name = $user.val();
    var id = $user.data('id');
    if (!id) {
        console.log('no user id !');
        $form.find('.js-luckyUser-error').removeClass('none').html('Please, select User from dropdown list.');
        $user.closest('.form-group').addClass('has-error');
        return false;
    }
    var amount = $form.find('input[name="sumAmount"]').val();
    var _token = $form.find('input[name="_token"]').val();

    $.post('/sendfunds', {
        user_id: id,
        name: name,
        amount: amount,
        timestamp: Date.now(),
        _token: _token
    }, function(data){
        console.log(data);
        if (data.success == false) {
            $form.find('.js-submit-result-msg').html(data.error).removeClass('none').addClass('error');
        } else {
            var balanceStr = data.response.balanceStr;
            APP.balance = data.response.balance;
            $form.find('.js-balance').text(balanceStr);
            $form.find('.js-sum-amount').spinner('option', 'max', APP.balance).val(APP.minSumAmountToSend);
            if (APP.balance < APP.minSumAmountToSend) {
                $form.find('#submit').prop('disabled', true);
            }
            $form.find('.js-submit-result-msg').html(data.response.message).removeClass('none').removeClass('error');
        }
    });
};

function extendValidationMethods() {
    jQuery.validator.addMethod('passwordNormal', function(value, element){
        return this.optional(element) || /^[a-zA-Z0-9!@#$%^&*()_+\-=;:]{8,32}$/.test(value);
    }, 'Password must contain latin letters, numbers and !@#$%^&*()_+-=;: characters only.');

    jQuery.validator.addMethod('nameNormal', function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9_\- а-яА-ЯёЁ]{3,}$/.test(value);
    }, 'Please, provide a real name. Words combined with Latin or Russian letters, numbers and underscore only.');
}

APP.showAuthModal = function() {
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
