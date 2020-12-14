// 渐变切换
$(function (){
    const $imgs = $('#slider img')
    count = 0
    function sliderIn(){
        $imgs.eq(count).addClass('active')
    }
    function sliderOut(){
        $imgs.eq(count).removeClass('active')
    }
    function change(){
        sliderOut()
        count++
        if(count >= 3)
        {
            count = 0
        }
        sliderIn()
    }
    setInterval(change, 2000)
})

// 刷新验证码。。
$('.huan').click(function () 
{
    location.reload();
})