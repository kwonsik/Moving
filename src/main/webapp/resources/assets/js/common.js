
$(function(){
  isGnbExpand();

  $(".gnb .gnb__link").on("mouseover focusin", function(){
    $(this).parent(".gnb__item").addClass("is-active");
    
    isGnbExpand();
  });

  $(".gnb .gnb__link").on("mouseout focusout", function(){
    $(this).parent(".gnb__item").removeClass("is-active");
  });
});

// function
function isGnbExpand(){
  let isGnbExpand = $("button.gnb__link").parents(".gnb__item").hasClass("is-active");

  if(isGnbExpand) {
    $(".gnb").addClass("is-expand");
  } else {
    $(".gnb").removeClass("is-expand");
  };
}