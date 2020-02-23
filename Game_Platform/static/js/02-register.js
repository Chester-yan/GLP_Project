

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
                // console.log("registStatus:"+data.status);
            },'json'
        );
    });
    /* 2.為#formReg表單元素綁定submit事件 */
    $("#formReg").submit(function(){
        //判断registStatus的值，決定表單是否要被提交
        // console.log('registStatus:'+registStatus);
        if(window.registStatus == 1)
            return false;
        return true;
    });
});


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






// iframe視窗尺寸    
function resize() {
    var div_width = $('#register_page').outerWidth(true); 
    console.log('div_width:',div_width)

    var div_height = $('#register_page').outerHeight(true); 
    console.log('div_height:',div_height)

    parent.document.getElementById("show_register").width = div_width;
    parent.document.getElementById("show_register").height = div_height;
    
};

