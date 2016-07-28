
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
         $("#childsar").show();
     }
     else
     {
	      $("#childsar").hide();
     }
  });
});


$(document).ready(function(){
  $("#childs2").change(function (){
     if ($(this).val() == "2"){
         $("#childsar2").show();
     }
     else
     {
	      $("#childsar2").hide();
     }
  });
});




$(document).ready(function(){
  $("#schilds2").change(function (){
     if ($(this).val() == "2"){
         $("#schildsar2").show();
     }
     else
     {
	      $("#schildsar2").hide();
     }
  });
});


$(document).ready(function(){
  $("#schilds3").change(function (){
     if ($(this).val() == "2"){
         $("#schildsar3").show();
     }
     else
     {
	      $("#schildsar3").hide();
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
        autoplaySpeed: 2000
    });

});


$('.autoplay2').slick({
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        arrows: false
    });