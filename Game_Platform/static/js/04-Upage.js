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



$('#edit_button').submit(function(){
    // var id_uphoto = $("#id_uphoto").val()
    // var ubd_value_div = $("#ubd_value_div").val()
    // var ugender_val = $("#id_ugender").val()
    // var ucredit_edit = $("#ucredit_edit").val()
    // var id_ufriend = $("#id_ufriend").val()
    // var id_usubs = $("#id_usubs").val()
    // var id_uintro = $("#id_uintro").val()
    
    // console.log(id_uphoto,ugender_val,ubd_value_div,ucredit_edit,id_ufriend,id_usubs,id_uintro)

});

// $(function(){
//     edit();
// });