

// iframe視窗尺寸    
function resize() {
    var div_width = $('#register_page').outerWidth(true); 
    // console.log(div_height)
    var div_height = $('#register_page').outerHeight(true); 
    parent.document.getElementById("show_register").width = div_width;
    parent.document.getElementById("show_register").height = div_height;
    
};


/* 異步向服務器發出請求，檢查用戶是否處於登入狀態 */
function close_iframe(){
    // 獲取iframe的div
    var regi_block = parent.document.getElementById("register_block");
    
    // 向　/check_login/ 發異步請求
    $.get('/check_login/',function(data){
        // console.log(data);
        if (data.loginStatus == 1) {
            parent.window.location.reload()
        } else {
            regi_block.style.display = 'block'

        }

    },'json');
};


$(function(){
    /* 調用check_login檢查登入狀態 */
    close_iframe();
});

