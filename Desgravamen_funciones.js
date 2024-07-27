
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