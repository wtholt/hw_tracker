$(document).ready(function(){
  
  $('.opaque').hover(function() {
    $(this).animate({
      opacity: 0.50,
    }, 'slow');
  }, function() {
    $(this).animate({
      opacity: 1,
    }, 'slow');
  });

  $('.resize').hover(makeBigger, returnToOriginalSize);

  function makeBigger() {
    $(this).css({height: '+=20%', width: '+=20%'});
  }
  function returnToOriginalSize() {
    $(this).css({height: "", width: ""});
  }













});

