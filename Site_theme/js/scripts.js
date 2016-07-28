
jQuery(document).ready(function () {

                    jQuery("#DemoModal1").modal({"show":true});

                    jQuery('#DemoModal1').modal({"show":false});
});


/**
 * Vertically center Bootstrap 3 modals so they aren't always stuck at the top
 */
$(function() {
    function reposition() {
        var modal = $(this),
            dialog = modal.find('.modal-dialog');
        modal.css('display', 'block');
        
        // Dividing by two centers the modal exactly, but dividing by three 
        // or four works better for larger screens.
        dialog.css("margin-top", Math.max(0, ($(window).height() - dialog.height()) / 2));
    }
    // Reposition when a modal is shown
    $('.modal').on('show.bs.modal', reposition);
    // Reposition when the window is resized
    $(window).on('resize', function() {
        $('.modal:visible').each(reposition);
    });
});






$(document).ready(function(){
  $("#rooms").change(function (){
     if ($('#rooms').val() == "2 комнаты"){
         $("#nowshow1").show();
		  $("#ll2").text("Взрослые комната 2");
     }
     else
     {
         $("#nowshow1").hide();
           $("#ll1").text("Взрослые");
		  $("#ll2").text("Взрослые");
     }
     
     
     if ($('#rooms').val() == "3 комнаты"){
         $("#nowshow2").show();
		  $("#ql1").text("Взрослые комната 2");
		   $("#ql2").text("Взрослые комната 3");
     }
     else
     {
         $("#nowshow2").hide();
          $("#ll1").text("Взрослые");
		  $("#ql1").text("Взрослые");
		   $("#ql2").text("Взрослые");
     }
  });
});



$(document).ready(function(){
  $("#childs1").change(function (){
     if ($(this).val() == "2"){
            $(".hide-one").addClass("wds50a");
         $("#childsar").addClass("show-all2a");
            $(".noactives").hide();
         
     }
     else
     {
	         $(".hide-one").removeClass("wds50a");
		  $("#childsar").removeClass("show-all2a");
     }
  });
  
   $("#childs1").change(function (){
     if ($(this).val() == "1"){
            $(".noactives").hide();
         
     }
     else
     {

     }
  });
  
  
    $("#childs1").change(function (){
     if ($(this).val() == "0"){
            $(".noactives").show();
         
     }
     else
     {
	     $(".noactives").hide();
     }
  });
  
 
});






$(document).ready(function(){
  $("#childs3").change(function (){
     if ($(this).val() == "2"){
            $(".hide-one3").addClass("wds50a3");
         $("#childsar3").addClass("show-all2a3");
            $(".noactives2").hide();
         
     }
     else
     {
	         $(".hide-one3").removeClass("wds50a3");
		  $("#childsar3").removeClass("show-all2a3");
     }
  });
  
   $("#childs3").change(function (){
     if ($(this).val() == "1"){
            $(".noactives3").hide();
         
     }
     else
     {

     }
  });
  
  
    $("#childs3").change(function (){
     if ($(this).val() == "0"){
            $(".noactives3").show();
         
     }
     else
     {
	     $(".noactives3").hide();
     }
  });
  
 
});





$(document).ready(function(){
  $("#childs4").change(function (){
     if ($(this).val() == "2"){
            $(".hide-one4").addClass("wds50a4");
         $("#childsar4").addClass("show-all2a4");
            $(".noactives4").hide();
         
     }
     else
     {
	         $(".hide-one4").removeClass("wds50a4");
		  $("#childsar4").removeClass("show-all2a4");
     }
  });
  
   $("#childs4").change(function (){
     if ($(this).val() == "1"){
            $(".noactives4").hide();
         
     }
     else
     {

     }
  });
  
  
    $("#childs4").change(function (){
     if ($(this).val() == "0"){
            $(".noactives4").show();
         
     }
     else
     {
	     $(".noactives4").hide();
     }
  });
  
 
});






$(document).ready(function(){
  $("#childs2").change(function (){
     if ($(this).val() == "2"){
            $(".hide-one2").addClass("wds50a2");
         $("#childsar2").addClass("show-all2a2");
            $(".noactives2").hide();
         
     }
     else
     {
	         $(".hide-one2").removeClass("wds50a2");
		  $("#childsar2").removeClass("show-all2a2");
     }
  });
  
   $("#childs2").change(function (){
     if ($(this).val() == "1"){
            $(".noactives2").hide();
         
     }
     else
     {

     }
  });
  
  
    $("#childs2").change(function (){
     if ($(this).val() == "0"){
            $(".noactives2").show();
         
     }
     else
     {
	     $(".noactives2").hide();
     }
  });
  
 
});






$(document).ready(function() {
 
    $('.autoplay').slick({
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 4000
    });

});


$('.autoplay2').slick({
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: true
    });