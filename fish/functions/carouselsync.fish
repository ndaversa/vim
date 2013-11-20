function carouselsync
  echo rsync $HOME/$DEV/$CAROUSELJS/carousel.js $HOME/$DEV/$WEB/laravel/vendor/ndaversa-carousel-js/carousel.js
  rsync $HOME/$DEV/$CAROUSELJS/carousel.js $HOME/$DEV/$WEB/laravel/vendor/ndaversa-carousel-js/carousel.js
end;
