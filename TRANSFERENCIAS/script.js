function loadContent(filename) {
    fetch(filename)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            document.getElementById('content').innerHTML = data;
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            document.getElementById('content').innerHTML = '<p>Ocurrió un error al cargar el contenido.</p>';
        });
}

// Para cargar el primer contenido por defecto
/*
document.addEventListener('DOMContentLoaded', function() {
    loadContent('directa.html');
});
*/