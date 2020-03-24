function edit() {
    $('#uphoto_value_div,#ugender_value_div,#ucredit_value_div,#ufriend_value_div,#usubs_value_div,#uintro_value_div').css('display','none');
    $('#uphoto_edit,#id_ugender,#ucredit_edit,#ufriend_edit,#usubs_edit,#uintro_edit').css('display','flex');

    // $("#edit_button").prev("#edit_button").html("<input type='submit' name=' value='儲存'>")
    $("[id=edit_button]").attr({"type":"submit","value":"完成"})
    
};
// "onclick":"edit_completed()",

function edit_completed() {
    $('#uphoto_value_div,#ugender_value_div,#ucredit_value_div,#ufriend_value_div,#usubs_value_div,#uintro_value_div').css('display','flex');
    $('#uphoto_edit,#id_ugender,#ucredit_edit,#ufriend_edit,#usubs_edit,#uintro_edit').css('display','none');


    $("[id=edit_button]").attr({"onclick":"edit()","type":"button","value":"編輯"})

};

$('#edit_button').blur(function(){
    console.log($('#id_uphoto').val())



    //     $.get('/check_edit/',function(data){
//         console.log(data)
//     },'json');

});

$("[id=edit_button]").submit(function(){
    console.log($('#id_uphoto'))

});

// $(function(){
//     edit();
// });