
//carrusel
const carousel = document.querySelector('.banner-carousel');
const items = carousel.children;
const prevButton = document.querySelector('.banner-prev');
const nextButton = document.querySelector('.banner-next');

let currentIndex = 0;

prevButton.addEventListener('click', () => {
  currentIndex--;
  if (currentIndex < 0) {
    currentIndex = items.length - 1;
  }
  updateCarousel();
});

nextButton.addEventListener('click', () => {
  currentIndex++;
  if (currentIndex >= items.length) {
    currentIndex = 0;
  }
  updateCarousel();
});

function updateCarousel() {
  for (let i = 0; i < items.length; i++) {
    items[i].style.transform = `translateX(${(i - currentIndex) * 100}%)`;
  }
}

//inica carrusel
updateCarousel();
