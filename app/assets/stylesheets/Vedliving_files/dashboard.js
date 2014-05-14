(function() {
  $(function() {
    $('.sanc-nav li').click(function() {
      return $(this).addClass('current').siblings().removeClass('current');
    });
    $('.month').click(function() {
      var $this;
      $this = $(this);
      $('.month').removeClass('current');
      $this.addClass('current');
      if ($this.hasClass('month')) {

      } else {

      }
    });
    return $('.sanc-content .arrow').click(function() {});
  });

}).call(this);
