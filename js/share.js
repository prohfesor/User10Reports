jQuery(document).ready(function(){
    jQuery("li.switch a, li.button.share a").click(function(){
        jQuery(".side-block").toggle();
        return false;
    });
});