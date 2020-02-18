
var regi_block = document.getElementById("register_block");
function dis_regi() {
    regi_block.style.display = "none";
}

function cancle(obj) {
    obj.style.display = "none";
}

function show() {
    regi_block.style.display = "block";
    
}  

window.onload = dis_regi;


/* 異步向服務器發出請求，檢查用戶是否處於登入狀態 */
function check_login(){

	// 向　/check_login/ 發異步請求
	$.get('/check_login/',function(data){
		var html = "";
		if(data.loginStatus == 0){
			html += "<a href='javascript:show();'>註冊/登入</a>";
		}else{
			html += "<a href='/04-logout'>登出</a>";
		}
        $("#login").html(html);
        // if(data.loginStatus == 0){
		// 	html += "<a href='javascript:show();'>註冊/登入</a>";
		// }else{
		// 	html += "<a href='/04-logout'>登出</a>";
		// }
		// $("#track").html(html);
	},'json');
}

$(function(){
	/* 調用check_login檢查登入狀態 */
	check_login();
});