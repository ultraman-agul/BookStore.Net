function sliderfun(){
    var slider = document.getElementById('slider')
    var imgs = slider.getElementsByTagName('img')
    count = 1
    function sliderIn(){
        imgs[count].className = "active"
    }
    function sliderOut(){
        imgs[count].className = ""
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
}

sliderfun()