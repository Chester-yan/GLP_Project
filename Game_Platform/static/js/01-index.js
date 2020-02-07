
function dis_regi() {
    regi_block = document.getElementById("register_block");
    regi_block.style.display = "none";
}

function cancle(obj) {
    obj.style.display = "none";
}

function show() {
    regi_block.style.display = "block";
    
}  

window.onload = dis_regi;
