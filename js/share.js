jQuery(document).ready(function(){
    jQuery("li.switch a, li.button.share a").click(function(){
        jQuery(".side-block").toggle();
        jQuery(".buttons-block .share, .buttons-block .first").toggleClass("active");
        jQuery(".content .wrap").toggleClass("centered-body");
        return false;
    });
});

jQuery('#form-share').submit(function(e){
    jQuery.ajax({
        type: 'POST',
        url: '/share/',
        data: jQuery(this).serialize(),
        success: sharesuccess,
        dataType: 'json'
    });
    return false;
});

function sharesuccess( data ){
    if(data.status=='Success'){
        el = jQuery("ul.mail-list li:first").clone();
        jQuery(el).find('span.mail').html(data.content);
        jQuery(el).find('span.hint').html('Sent right now');
        jQuery("ul.mail-list").append( el );
        jQuery("#form-share input[name=email]").val('');
    } else {
        alert( data.content );
    }
}