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

video1.addEventListener('play',function(){
	video1play = true
	video1pause = false

	video2play = false
	video3play = false

},false)
video1.addEventListener('pause',function(){
	video1pause = true
	video1play = false
},false)

video2.addEventListener('play',function(){
	video2play = true
	video2pause = false

	video1play = false
	video3play = false

},false)
video2.addEventListener('pause',function(){
	video2pause = true
	video2play = false
},false)

video3.addEventListener('play',function(){
	video3play = true
	video3pause = false

	video1play = false
	video2play = false
},false)
video3.addEventListener('pause',function(){
	video3pause = true
	video3play = false
},false)


$(function autoplay(){
	video1onplay()

	$('#video1,#video2,#video3').css('transition','all 450ms ease 0s')
	
	$('#video1').css({'transform':'scale(1)','z-index':'3'})

	$('#video2').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video3').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})


});


function video1onplay(){
	clearInterval(timerVideo3);
	clearInterval(timerVideo2);
	video1.currentTime = 20;
	video1.play();
	video2.pause();
	video3.pause();

	$('#video1').css({'transform':'scale(1)','z-index':'3'})

	$('#video2').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video3').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})

	timerVideo1 = setInterval(video2onplay,5000);

}

function video2onplay(){
	clearInterval(timerVideo1);
	clearInterval(timerVideo3);
	video2.currentTime = 20;
	video2.play();
	video1.pause();
	video3.pause();

	$('#video2').css({'transform':'scale(1)','z-index':'3'})

	$('#video3').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video1').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})

	timerVideo2 = setInterval(video3onplay,5000);

}

function video3onplay(){
	clearInterval(timerVideo2);
	clearInterval(timerVideo1);
	video3.currentTime = 20;
	video3.play();
	video1.pause();
	video2.pause();

	$('#video3').css({'transform':'scale(1)','z-index':'3'})

	$('#video1').css({'transform':'translateX(20%) scale(0.85)','z-index':'2'})

	$('#video2').css({'transform':'translateX(-20%) scale(0.85)','z-index':'2'})

	timerVideo3 = setInterval(video1onplay,5000);

}


function angle_left() {

	if (video1play) {
		video3onplay()
	}
		
	if (video2play) {
		video1onplay()
	}

	if (video3play) {
		video2onplay()
	}

}

function angle_right() {

	if (video1play) {
		video2onplay()
	}
		
	if (video2play) {
		video3onplay()
	}

	if (video3play) {
		video1onplay()
	}

}


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


