(function() {
  var initAvatarImages;

  initAvatarImages = function() {
    return $('.avatar').imagesLoaded().fail(function(imgs) {
      var i, img, len, ref, results;
      ref = imgs.images;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        img = ref[i];
        if (img.isConfirmed && !img.isLoaded) {
          results.push($(img.img).closest('.avatar').addClass('error'));
        } else {
          results.push(void 0);
        }
      }
      return results;
    });
  };

  $(document).on('ready page:load', function() {
    return initAvatarImages();
  });

}).call(this);
