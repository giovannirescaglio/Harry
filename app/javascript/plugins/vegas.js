import "vegas/dist/vegas.css";
import "../vendor/vegas";

function slideShow() {
  const banner = document.querySelector(".banner");
  if (banner) {
    const images = JSON.parse(banner.dataset.images);
    $(".banner").vegas({
      slides: images,
      transition: 'fade',
      timer: true,
      delay: 5000,
    });
  }
}

export { slideShow };
