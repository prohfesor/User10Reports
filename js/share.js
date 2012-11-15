jQuery(document).ready(function(){
    jQuery("li.switch a").click(function(){
        jQuery(".side-block").toggle();
        return false;
    });
});