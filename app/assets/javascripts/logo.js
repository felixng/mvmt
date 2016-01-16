function header_init() {
    window.addEventListener('scroll', function(e){
        var distanceY = window.pageYOffset || document.documentElement.scrollTop,
            shrinkOn = 50,
            header = document.querySelector(".bt-menu-brand");
        if (distanceY > shrinkOn) {
            classie.add(header,"scrolled");
        } else {
            if (classie.has(header,"scrolled")) {
                classie.remove(header,"scrolled");
            }
        }
    });
}

window.onload = header_init();