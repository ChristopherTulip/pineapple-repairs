$('document').ready(function () {

	function scrollToTarget(target) {
		var $target = $(target);
		console.log($target);
		
		$('html, body').stop().animate({
		   'scrollTop': $target.offset().top
		}, 300, 'swing', function () {
		  window.location.hash = target;
		});
	}

	$('body').on('click', 'a[href^="#"]', function (event) {
		event.preventDefault();	

		console.log(this.hash);

		if (this.pathname === document.location.pathname) {
			scrollToTarget(this.hash);
		} else {
			document.location.href = this.href;
		}
	});

	$('body').on('click', 'a[href=""]', function (event) {
		event.preventDefault();

		var templateName = $(this).data('template'),
				promise = $.ajax({
					url: '/templates/' + templateName + '.html',
					type: 'GET',
					cache: false
				});

		promise.done(function (field) {
			$('.link-row').before(field);
			Locations.initialize();
		});
	});
});