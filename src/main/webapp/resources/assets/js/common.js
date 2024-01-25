$(function() {
	const isGnbExpand = $("button.gnb__link").parents(".gnb__item").hasClass("is-active");
	if (isGnbExpand) {
		$(".gnb").addClass("is-expand");
	}
});