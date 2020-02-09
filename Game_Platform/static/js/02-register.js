// 生日日期選單
function set_ddl_date(year_start) {
    var now = new Date();
    var ddl_year = document.getElementById("ddl_year");

    //年(year_start~今年)
    for (var i = now.getFullYear(); i >= year_start; i--) {
        $('#ddl_year').append($("<option></option>").attr("value", i).text(i));
    }

    //月
    for (var i = 1; i <= 12; i++) {
        $('#ddl_month').
        append($("<option></option>").
        attr("value", i).
        text(i));
    }

    $('#ddl_year').change(onChang_date);
    $('#ddl_month').change(onChang_date);

    //年、月選單改變時
    function onChang_date() {
        if ($('#ddl_year').val() != -1 && $('#ddl_month').val() != -1) {

            var date_temp = new Date($('#ddl_year').val(), $('#ddl_month').val(), 0);

            //移除超過此月份的天數
            $("#ddl_day option").each(function () {
                if ($(this).val() != -1 && $(this).val() > date_temp.getDate()) $(this).remove();
            });

            //加入此月份的天數
            for (var i = 1; i <= date_temp.getDate(); i++) {
                if (!$("#ddl_day option[value='" + i + "']").length) {
                    $('#ddl_day').
                    append($("<option></option>").
                    attr("value", i).
                    text(i));
                }
            }
        } else {
            $("#ddl_day option:selected").removeAttr("selected");
        }
    }
}

//1911為開始年份
set_ddl_date(1911);


// // fb登入app
// window.fbAsyncInit = function() {
//     FB.init({
//       appId      : '170092130952551',
//       cookie     : true,
//       xfbml      : true,
//       version    : '{v6.0}'
//     });
      
    
//     FB.getLoginStatus(function(response) {
//         statusChangeCallback(response);
//     });  
      
//   };

//   (function(d, s, id){
//      var js, fjs = d.getElementsByTagName(s)[0];
//      if (d.getElementById(id)) {return;}
//      js = d.createElement(s); js.id = id;
//      js.src = "https://connect.facebook.net/en_US/sdk.js";
//      fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));

//    function statusChangeCallback(response){
//        if (response.status === 'connected') {
//            console.log('Logged in and authenticated')
//        } else {
//            console.log('Not authenticated')
//        }

//    }


//     function checkLoginState() {
//         FB.getLoginStatus(function(response) {
//         statusChangeCallback(response);
//         });
//     }

//     // function checkLoginState() {
//     //     FB.getLoginStatus(function (response) {
//     //       console.log(response)
//     //     });
//     //   }
//     //   checkLoginState()

//     // function login() {
//     //     FB.login(function (response) {
//     //       /*console.log(response);*/
//     //     });
//     //   }
      
//     //   function logout() {
//     //     FB.logout(function (response) {
//     //       /*console.log(response)*/
//     //     });
//     //   }


// window.fbAsyncInit = function() {
//     FB.init({
//       appId      : '170092130952551',
//       cookie     : true,
//       xfbml      : true,
//       version    : 'v6.0'
//     });
      
//     FB.AppEvents.logPageView();   
    
      
//   };

//   (function(d, s, id){
//      var js, fjs = d.getElementsByTagName(s)[0];
//      if (d.getElementById(id)) {return;}
//      js = d.createElement(s); js.id = id;
//      js.src = "https://connect.facebook.net/en_US/sdk.js";
//      fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));

//    FB.getLoginStatus(function(response) {
//       statusChangeCallback(response);
//   });


//////////////////////////////////
//   function login() {
//     FB.login(function (response) {
//       console.log(response);
//       if (response.status === "connected") {
//         FB.api('/me', {
//           'fields': 'id,name,email,picture'
//         }, function (response) {
//           console.log(response);
//         });
//       }
//     }, {
//         scope: 'email',
//         auth_type: 'rerequest'
//       });
//   }
  
//   function logout() {
//     FB.logout(function (response) {
//       console.log(response)
//     });
//   }

//   function checkLoginState() {
//     FB.getLoginStatus(function (response) {
//       if(response.status === 'connected'){
//         console.log('你已經登入囉')
//       }else{
//         login()
//       }
//     });
//   }
//   checkLoginState()