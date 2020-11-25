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


window.onload=function (){
    document.getElementById("i1").classList.remove("active");
    document.getElementById("i2").classList.remove("active");
    document.getElementById("i3").classList.remove("active");
    document.getElementById("i4").classList.remove("active");
    document.getElementById("i5").classList.remove("active");
    let i = window.location.href.split("=")[2]
    switch (i){
        case '5':
        document.getElementById("i5").classList.add("active");
        case '4':
        document.getElementById("i4").classList.add("active");
        case '3': 
        document.getElementById("i3").classList.add("active");
        case '2': 
        document.getElementById("i2").classList.add("active"); 
        case '1':
        document.getElementById("i1").classList.add("active"); 
        break;
    }
}

