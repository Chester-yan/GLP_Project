function edit() {
    $('#ugender_value_div,#ucredit_value_div,#ufriend_value_div,#usubs_value_div,#uintro_value_div').css('display','none');
    $('#uphoto_edit,#id_ugender,#ucredit_edit,#ufriend_edit,#usubs_edit,#uintro_edit').css('display','flex');

    $("[id=edit_button]").attr({"onclick":"", "type":"submit","value":"完成"})
    var $input = $("<input id='edit_button' onclick='edit_completed();' type='button' value='退出'>")
    $("#submit_div").append($input)
    
};

function edit_completed() {
    $('#uphoto_value_div,#ugender_value_div,#ucredit_value_div,#ufriend_value_div,#usubs_value_div,#uintro_value_div').css('display','flex');
    $('#uphoto_edit,#id_ugender,#ucredit_edit,#ufriend_edit,#usubs_edit,#uintro_edit').css('display','none');

    var $input = $("<input id='edit_button' onclick='edit();' type='button' value='編輯'>")
    $("#submit_div").html($input)
    
};
