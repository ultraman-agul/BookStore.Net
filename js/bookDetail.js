document.getElementById("tab1").onclick = function(){
    document.getElementById("dv1").className = "current";
    document.getElementById("dv2").className = "normal";
    
    document.getElementById("tab1").className = "clickli";
    document.getElementById("tab2").className = "";
}

document.getElementById("tab2").onclick = function(){
    document.getElementById("dv2").className = "current";
    document.getElementById("dv1").className = "normal";

    document.getElementById("tab2").className = "clickli";
    document.getElementById("tab1").className = "";
}