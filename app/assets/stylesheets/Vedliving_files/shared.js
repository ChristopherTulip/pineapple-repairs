(function() {
  $(function() {
    var legalNav, scrollToTarget;
    scrollToTarget = function($target) {
      return $('html, body').stop().animate({
        'scrollTop': $target.offset().top
      }, 300, 'swing', function() {
        return window.location.hash = $target.attr('id');
      });
    };
    $('a[href^="#"]').click(function(event) {
      event.preventDefault();
      return scrollToTarget($(this.hash));
    });
    $('.account-next').click(function(event) {
      event.preventDefault();
      return $('input[type="submit"]').click();
    });
    $('.terms-list a').click(function() {
      $('.terms-list li').removeClass('current');
      return $(this).parent().addClass('current');
    });
    $('.nav-toggle').click(function() {
      var $termsList, $this;
      $this = $(this);
      $termsList = $this.closest('.terms-list');
      return $termsList.toggleClass('open');
    });
    legalNav = function() {
      var hash;
      hash = window.location.hash;
      console.log(hash);
      return $('.nav-links a').each(function() {
        var $termsList, $this;
        $this = $(this);
        $termsList = $this.closest('.terms-list');
        if ($this.attr('href') === hash) {
          console.log($termsList);
          if ($termsList.find('.nav-toggle').is(':visible')) {
            $termsList.addClass('open').find('li').removeClass('current').find('.nav-toggle').trigger('click');
          }
          return $this.parent().addClass('current');
        }
      });
    };
    legalNav();
    return $('input').keydown(function(event) {
      var $this, key;
      $this = $(this);
      key = event.keyCode;
      if (key !== 8) {
        return $this.addClass('filled');
      } else {
        if ($this.val().length === 1) {
          return $this.removeClass('filled');
        }
      }
    });
  });

}).call(this);
