function show() {
    document.getElementById("imgbox").style.display = "block"
}
function hid() {
    document.getElementById("imgbox").style.display = "none"
}


$('#BGC').click(function () {
    var s = $(this).html()
    if (s == '夜间模式') {
        $('*').css({
            'color': 'white',
            'background-color': '#222'
        }
        )
        $(this).html('白天模式')
    }
    else {
        location.reload()
    }
})