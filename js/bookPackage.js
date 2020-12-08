// index.js文件
$(function () {
    $(function () {
        let t1 = setInterval(timer_back,3000); // 定时更换背景图片
        $('#rotation').mouseenter(function () {
            clearInterval(t1);
        })
        $('#rotation').mouseleave(function () {
            t1 = setInterval(timer_back,3000);
        })
        $('.dot_li').mouseenter(function () {
            $(this).css({'backgroundColor':'white'});
        })
        $('.dot_li').mouseleave(function () {
            if ($(this).attr('flag') !== 'true'){
                $(this).css({'backgroundColor':'#5c8382'});
            }
        })
        $('.dot_li').click(function () {
            $(this).attr({'flag':'true'});
            let number = parseInt($(this).attr('num'));
            change_back(number);
        })
        $('.arrow_left,.arrow_right').mouseenter(function () {
            $(this).css({'backgroundColor':'#727374'});
            $(this).animate({'opacity':'1'},'slow');
        })
        $('.arrow_left,.arrow_right').mouseleave(function () {
            $(this).css({'backgroundColor':'transparent'});
            $(this).animate({'opacity':'0.5'},'slow');
        })
        let isclick = false;
        $('.arrow_right').click(function () {
            if (!isclick) {
                isclick = true;
                let number = parseInt($(this).attr('num')) + 1;
                if (number > 3) {
                    number = 0;
                }
                change_back(number);
                setTimeout(function () {
                    isclick = false;
                },700);
            }
        })
        $('.arrow_left').click(function () {
            if (!isclick) {
                isclick=true;
                let number = parseInt($(this).attr('num'))-1;
                if(number < 0){
                    number = 3;
                }
                change_back(number);
                setTimeout(function () {
                    isclick = false;
                },700);
            }
        })
        function change_back(number) {
            // 为了背景图淡入淡出效果，我们必须图片重叠放置
            // 图片重叠放置，会造成第一张图片的img标签的index其实是最大的，为4！最后一张图片，index为0！
            // 因此下面循环是4-number，而不是number
            for (let i = 4;i > 4-number;i--){
                $('img').eq(i).animate({'opacity':0},'slow');
            }
            // img标签的index和number不一样，需要4-number
            $('img').eq(4-number).animate({'opacity':1},'slow');
            // li标签和number的顺序是一致的，因此可以直接填写number
            $('.dot_li').eq(number).css({'backgroundColor':'white'});
            $('.dot_li').eq(number).siblings().css({'backgroundColor':'#5c8382'}).attr({'flag':'false'});
            $('.arrow_right,.arrow_left').attr({'num':number});
        }
        // 更换背景图片方法
        function timer_back(){
            let nums = parseInt($('#rotation').children().eq(5).attr('num'))+1;
            if(nums > 3){
                nums = 0;
            }
            change_back(nums);
        }
    })
})