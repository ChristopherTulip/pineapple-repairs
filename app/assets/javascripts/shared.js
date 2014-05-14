$('document').ready(function () {

	function scrollToTarget(target) {
		var $target = $(target)
		
		$('html, body').stop().animate({
		   'scrollTop': $target.offset().top
		}, 300, 'swing', function () {
		  window.location.hash = target;
		});
	}

	$('body').on('click', 'a[href^="/#"]', function (event) {
		event.preventDefault();	

		if (this.pathname === document.location.pathname) {
			scrollToTarget(this.hash);
		} else {
			document.location.href = this.href;
		}
	});
});