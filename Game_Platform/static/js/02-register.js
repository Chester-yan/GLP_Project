// 帳號驗證
$(function (){
    //表示帳號是否已被注册過的狀態值
    window.registStatus = 1;

    /*為uname控件綁定blur事件 */
    $("input[name='uname']").blur(function(){
        // 如果輸入框沒有任何東西則返回
        if ($(this).val().trim().length == 0)
        return ;
        // 如果輸入框有數據則發送ajax請求判斷數據是否存在
        $.get(
            '/check_uname/',
            {'uname':$(this).val()},
            function(data){
                $("#err_tip").html(data.msg);
                //为registStatus赋值，以便在提交表單時使用
                window.registStatus = data.status;
                console.log("data.status:"+data.status);
            },'json'
        );
    });
    /* 2.為#formReg表單元素綁定submit事件 */
    $("#formReg").submit(function(){
        //判断registStatus的值，決定表單是否要被提交
        console.log('registStatus:'+registStatus);
        if(window.registStatus == 1)
            return false;
        return true;
    });
});

// $(function(){
//     //表示手机号是否已经被注册过的状态值
//     // var registStatus = 1;
//     window.registStatus = 1;
  
//     /**1.为uhpone控件绑定blur事件*/
//     $("input[name='uname']").blur(function(){
//       //如果文本框内没有任何东西则返回
//       if($(this).val().trim().length == 0)
//         return;
//       //如果文本框内有数据的话则发送ajax请求判断数据是否存在
//       $.get(
//         '/check_uname/',
//         {'uname':$(this).val()},
//         function(data){
//           $("#err-tip").html(data.msg);
//           //为registStatus赋值，以便在提交表单时使用
//           window.registStatus = data.status;
//           console.log("data.status:"+data.status);
//         },'json'
//       );
//     });











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