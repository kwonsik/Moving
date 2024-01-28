$(function(){
  // GNB
  gnbActive();

  // SRCH INPUT
  $(".board-head .srch-box .btn-del").click(function(){
		$(this).prev(".inp").val("");
		$(this).hide();
		$(this).next(".btn-srch").click();
	});

	$(".board-head .srch-box .inp").on("input", function(){
		if($(this).val() == ""){
			$(this).siblings(".btn-del").hide();
		}else{
			$(this).siblings(".btn-del").show();
		}
	});
});

// function
function gnbActive(){
  // is-active
  let nowURLPath = window.location.pathname;
  
  $(".gnb .gnb__item a").parent("li").removeClass("is-active");
  
  $(".gnb .gnb__item a").each(function(){
  	let href=$(this).attr("href");
  	
  	if(nowURLPath.indexOf(href) > -1) {
  		$(this).parents("li").addClass("is-active");
  	}
  });
}