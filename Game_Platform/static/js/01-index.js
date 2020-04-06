window.onload = dis_regi;

var regi_block = document.getElementById("register_block");
function dis_regi() {
    regi_block.style.display = "none";
};

function cancle() {
    regi_block.style.display = "none";
};

function show() {
    regi_block.style.display = "block";
};  


// function show() {
// 	$('#register_block').css('display','block');
// 	// var $regwidth = $.ajax({url:'/02-register.html',async:false})
// 	var $regwidth = $.get('/02-register.html').document;
// 	var div_width = $.get('/02-register/','#register_page');
// 	console.log(div_width.document.offsetHeight)
	
// 	// console.log($regwidth)

//     var div_width = $('#document').outerWidth(true); 
// 	// console.log(div_width)
	
// 	// var chreg = children.document.getElementById("register_page").width;
// 	// console.log(chreg)

//     // $("[id=edit_button]").attr({"onclick":"", "type":"submit","value":"完成"})
//     // var $input = $("<input id='edit_button' onclick='edit_completed();' type='button' value='退出'>")
//     // $("#submit_div").append($input)
    
// };

// function SetCwinHeight() {
// 	var iframeid = document.getElementById("show_register"); //iframe id  
// 	console.log(iframeid.height)
// 	console.log(iframeid.contentDocument.body.css('height'))
//     if (document.getElementById) {
//         if (iframeid && !window.opera) {
//             if (iframeid.contentDocument && iframeid.contentDocument.body.offsetHeight) {
// 				iframeid.height = iframeid.contentDocument.body.offsetHeight;
// 				console.log(iframeid.height)
//             } else if (iframeid.Document && iframeid.Document.body.scrollHeight) {
//                 iframeid.height = iframeid.Document.body.scrollHeight;
//             }
//         }
//     }
// }


var $video1 = $('#video1').html();
var $video2 = $('#video2').html();
var $video3 = $('#video3').html();
var timer ;
var timerVideo1 ;
var timerVideo2 ;
var timerVideo3 ;

function video1_onended(){
	video1.onended()
	clearInterval(timerVideo1);

}

function video2_onended(){
	video2.onended()
	clearInterval(timerVideo2);

}

function video3_onended(){
	video3.onended()
	clearInterval(timerVideo3);

}

$(function autoplay(){
	video1.play()
	video2.pause()
	video3.pause()

	$('#video1,#video2,#video3').css('transition','all 450ms ease 0s')
	
	$('#video1').css({'transform':'scale(1)','z-index':'3'})

	$('#video2').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video3').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})

	timerVideo1 = setInterval(video1_onended,10000);

});


video1.onended = function (){
	video2.play()
	video1.pause()
	video3.pause()

	$('#video2').css({'transform':'scale(1)','z-index':'3'})

	$('#video3').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video1').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})

	timerVideo2 = setInterval(video2_onended,10000);

}

video2.onended = function (){
	video3.play()
	video1.pause()
	video2.pause()

	$('#video3').css({'transform':'scale(1)','z-index':'3'})

	$('#video1').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video2').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})

	timerVideo3 = setInterval(video3_onended,10000);

}

video3.onended = function (){
	video1.play()
	video2.pause()
	video3.pause()

	$('#video1').css({'transform':'scale(1)','z-index':'3'})

	$('#video2').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video3').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})

	timerVideo1 = setInterval(video1_onended,10000);


}


// video1.playbackRate = 10;
// video2.playbackRate = 10;
// video3.playbackRate = 10;

// video1.onended = function (){
// 	video2.play();
// 	video1.style.opacity = 0;
// 	video2.style.opacity = 1;
// }

// video2.onended = function(){
// 	video3.play();
// 	video2.style.opacity = 0;
// 	video3.style.opacity = 1;
// }

// video3.onended = function(){
// 	video1.play();
// 	video3.style.opacity = 0;
// 	video1.style.opacity = 1;
// }


/* 異步向服務器發出請求，檢查用戶是否處於登入狀態 */
function check_login(){
	// 向　/check_login/ 發異步請求
	$.get('/check_login/',function(data){
        var html = "";
		if(data.loginStatus == 0){
			html += "<a onclick='show();'>註冊/登入</a>";
		}else{ 
            html += "<a href='/logout'>登出</a>";
		}
        $("#login").html(html);
	},'json');
}



$(function(){
    /* 調用check_login檢查登入狀態 */
	check_login();
});


