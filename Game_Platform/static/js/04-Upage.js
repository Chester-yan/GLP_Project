function edit() {
    $('#ugender_value_div,#ucredit_value_div,#ufriend_value_div,#usubs_value_div,#uintro_value_div').css('display','none');
    $('#id_ugender,#ucredit_edit,#ufriend_edit,#usubs_edit,#uintro_edit').css('display','flex');

    
    $("[id=edit_button]").attr("onclick","edit_completed()")
    $("[id=edit_button]").html('完成');
    
};

function edit_completed() {
    $('#ugender_value_div,#ucredit_value_div,#ufriend_value_div,#usubs_value_div,#uintro_value_div').css('display','flex');
    $('#id_ugender,#ucredit_edit,#ufriend_edit,#usubs_edit,#uintro_edit').css('display','none');


    $("[id=edit_button]").attr("onclick","edit()")
    $("[id=edit_button]").html('編輯');

};


// $(function(){
//     edit();
// });