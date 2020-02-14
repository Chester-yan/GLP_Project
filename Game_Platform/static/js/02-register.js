// 生日日期選單
function set_bd_date(year_start) {
    var now = new Date();
    var bd_year = document.getElementById("bd_year");

    //年(year_start~今年)
    for (var i = now.getFullYear(); i >= year_start; i--) {
        $('#bd_year').append($("<option></option>").attr("value", i).text(i));
    }

    //月
    for (var i = 1; i <= 12; i++) {
        $('#bd_month').
        append($("<option></option>").
        attr("value", i).
        text(i));
    }

    $('#bd_year').change(onChang_date);
    $('#bd_month').change(onChang_date);

    //年、月選單改變時
    function onChang_date() {
        if ($('#bd_year').val() != -1 && $('#bd_month').val() != -1) {

            var date_temp = new Date($('#bd_year').val(), $('#bd_month').val(), 0);

            //移除超過此月份的天數
            $("#bd_day option").each(function () {
                if ($(this).val() != -1 && $(this).val() > date_temp.getDate()) $(this).remove();
            });

            //加入此月份的天數
            for (var i = 1; i <= date_temp.getDate(); i++) {
                if (!$("#bd_day option[value='" + i + "']").length) {
                    $('#bd_day').
                    append($("<option></option>").
                    attr("value", i).
                    text(i));
                }
            }
        } else {
            $("#bd_day option:selected").removeAttr("selected");
        }
    }
}

//1911為開始年份
set_bd_date(1911);



// fb登入app
window.fbAsyncInit = function() {
    FB.init({
        appId : '170092130952551',
        xfbml : true,
        version : 'v6.0'
        });

    FB.AppEvents.logPageView();
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    FB.login(function(response) {
        // handle the response
    }, {scope: 'public_profile,email'});

    FB.login(function(response) {
        if (response.status === 'connected') {
            // Logged into your webpage and Facebook.
        } else {
            // The person is not logged into your webpage or we are unable to tell. 
        }
    });