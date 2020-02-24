

// 帳號驗證
$(function (){
    //表示帳號是否已被注册過的狀態值
    window.uname_check = 1;
    window.uemail_check = 1;
    window.cpwd_check = 1;

    /*為uname控件綁定blur事件 */
    $("input[name='uname']").blur(function(){
        // 如果輸入框沒有任何東西則返回
        if ($(this).val().trim().length == 0)
            return $("#uname_err").html("必填欄位")
        // 如果輸入框有數據則發送ajax請求判斷數據是否存在
        $.get(
            '/check_uname/',
            {'uname':$(this).val()},
            function(data){
                $("#uname_err").html(data.msg);
                //为uname_check赋值，以便在提交表單時使用
                window.uname_check = data.status;
            },'json');
    });

    /*為uemail控件綁定blur事件 */
    $("input[name='uemail']").blur(function(){
        // 如果輸入框沒有任何東西則返回
        if ($(this).val().trim().length == 0)
            return $("#uemail_err").html("必填欄位")
        // 如果輸入框有數據則發送ajax請求判斷數據是否存在
        $.get(
            '/check_uemail/',
            {'uemail':$(this).val()},
            function(data){
                $("#uemail_err").html(data.msg);
                //为uemail_check赋值，以便在提交表單時使用
                window.uemail_check = data.status;

            },'json');
    });

    /*為cpwd控件綁定blur事件 */
    $("input[name='cpwd']").blur(function(){
        // 如果輸入框沒有任何東西則返回
        if ($(this).val().trim().length == 0)
            return $("#cpwd_err").html("必填欄位")
        // 如果輸入框有數據則判斷是否與upwd欄位相同
        var upwd = $("input[name='upwd']").val()
        var cpwd = $("input[name='cpwd']").val()

        if (cpwd == upwd) {
            $("#cpwd_err").html("OK")
            window.cpwd_check = 0

        } else {
            $("#cpwd_err").html("密碼不相符")
            Window.cpwd_check = 1

        }

    });

    /* 2.為#formReg表單元素綁定submit事件 */
    $("#formReg").submit(function(){
        //判断uname與uemail的狀態值，決定表單是否要被提交
        if(window.uname_check == 0 && 
            window.uemail_check == 0 &&
            window.cpwd_check == 0
            ) 
            return true;
        return false;
        
    });
});


// fb登入app
// window.fbAsyncInit = function() {
//     FB.init({
//         appId : '170092130952551',
//         xfbml : true,
//         version : 'v6.0'
//         });

//     FB.AppEvents.logPageView();
//     };

//     (function(d, s, id){
//         var js, fjs = d.getElementsByTagName(s)[0];
//         if (d.getElementById(id)) {return;}
//         js = d.createElement(s); js.id = id;
//         js.src = "https://connect.facebook.net/en_US/sdk.js";
//         fjs.parentNode.insertBefore(js, fjs);
//     }(document, 'script', 'facebook-jssdk'));

//     FB.login(function(response) {
//         // handle the response
//     }, {scope: 'public_profile,email'});

//     FB.login(function(response) {
//         if (response.status === 'connected') {
//             // Logged into your webpage and Facebook.
//         } else {
//             // The person is not logged into your webpage or we are unable to tell. 
//         }
//     });






// iframe視窗尺寸     
function resize() {
    var div_width = $('#register_page').outerWidth(true); 

    var div_height = $('#register_page').outerHeight(true); 

    parent.document.getElementById("show_register").width = div_width;
    parent.document.getElementById("show_register").height = div_height;
    
};

/* 異步向服務器發出請求，檢查用戶是否處於登入狀態 */
$(function register_login_check(){
    // 獲取iframe的div
    var regi_block = parent.document.getElementById("register_block");
    // 向　/check_login/ 發異步請求
    $.get('/check_login/',function(data){
        if (data.loginStatus == 1) {
            parent.window.location.reload()
        } else {
            regi_block.style.display = 'block'

        }

    },'json');
});


// $(function(){
//     /* 調用check_login檢查登入狀態 */
//     register_login_check();
// });