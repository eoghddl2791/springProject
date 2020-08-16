$('#cmt-img').click(function(){
	$('#cmt-modal').modal();
});

$('#x-btn').click(function(){
    $('#cmt-mocal').modal('toggle');
});

$(document).ready(function(){
	var windowWidth = $(window).innerWidth();
    var windowWidth1 = $(window).outerWidth();
    console.log(windowWidth+", "+windowWidth1);
    if(windowWidth1 < 768){
		$('.cmt-content').css("width", "100%");
    }else if(windowWidth1 < 992){
    	$('.cmt-content').css("width", "75%");
    }else if(windowWidth1 < 1200){
        $('.cmt-content').css("width", "58%");
    }else{
        $('.cmt-content').css("width", "48%");
    }

    if(windowWidth1 < 489){
            $(".cmt-textarea").css("width", "72%");
            $('#cmt-text').css("width", "100%");
        }else if(windowWidth1 < 768){
            $(".cmt-textarea").css("width", "80%");
            $('#cmt-text').css("width", "100%");
        }else{
            $(".cmt-textarea").css("width", "85%");
            $('#cmt-text').css("width", "100%");
        }
});

$(function(){
    $(window).resize(function(){
        var windowWidth = $(window).innerWidth();
        var windowWidth1 = $(window).outerWidth();
        console.log(windowWidth+", "+windowWidth1);
        if(windowWidth1 < 768){
    		$('.cmt-content').css("width", "100%");
	    }else if(windowWidth1 < 992){
	    	$('.cmt-content').css("width", "75%");
	    }else if(windowWidth1 < 1200){
	        $('.cmt-content').css("width", "58%");
	    }else{
	        $('.cmt-content').css("width", "48%");
        }
        
        if(windowWidth1 < 489){
            $(".cmt-textarea").css("width", "72%");
            $('#cmt-text').css("width", "100%");
        }else if(windowWidth1 < 768){
            $(".cmt-textarea").css("width", "80%");
            $('#cmt-text').css("width", "100%");
        }else{
            $(".cmt-textarea").css("width", "85%");
            $('#cmt-text').css("width", "100%");
        }
    });
});