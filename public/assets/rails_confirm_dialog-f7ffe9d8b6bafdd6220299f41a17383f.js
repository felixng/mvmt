(function() {
  var Confirm;

  Confirm = {
    initRailsHook: function() {
      return $.rails.allowAction = (function(_this) {
        return function(elem) {
          return _this.allowAction(elem);
        };
      })(this);
    },
    allowAction: function(elem) {
      var $modal, modal;
      modal = elem.data('confirm-modal');
      if (!modal) {
        return true;
      }
      $modal = $(modal);
      if ($modal && $.rails.fire(elem, 'confirm')) {
        this.showModal($modal, elem);
      }
      return false;
    },
    confirmed: function(elem) {
      if ($.rails.fire(elem, 'confirm:complete', [true])) {
        $.rails.allowAction = function() {
          return true;
        };
        elem.trigger('click');
        return $.rails.allowAction = this.allowAction;
      }
    },
    showModal: function($modal, elem) {
      if ($modal.hasClass('reveal-modal')) {
        $modal.foundation('reveal', 'open');
        $modal.find('[data-dismiss]').on('click', (function(_this) {
          return function() {
            return $modal.foundation('reveal', 'close');
          };
        })(this));
      } else {
        $modal.modal();
      }
      return $modal.find('[data-confirm]').on('click', (function(_this) {
        return function() {
          return _this.confirmed(elem);
        };
      })(this));
    }
  };

  $(function() {
    return Confirm.initRailsHook();
  });

}).call(this);
