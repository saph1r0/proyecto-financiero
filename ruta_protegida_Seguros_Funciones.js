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

 /* Funcion para todos los botones*/
 function changeText(option) {
    // Ocultar todos los bloques de contenido
    document.querySelectorAll('.content-section').forEach(section => {
        section.style.display = 'none';
    });

    // Mostrar el bloque de contenido correspondiente
    const selectedSection = document.getElementById(option);
    if (selectedSection) {
        selectedSection.style.display = 'block';
    }
}

function toggleAnswer(element) {
    const answer = element.nextElementSibling;
    const icon = element.querySelector('.faq-icon');

    if (answer) {
        if (answer.style.display === "none" || answer.style.display === "") {
            answer.style.display = "block";
            icon.style.transform = "rotate(180deg)";
        } else {
            answer.style.display = "none";
            icon.style.transform = "rotate(0deg)";
        }
    }
}