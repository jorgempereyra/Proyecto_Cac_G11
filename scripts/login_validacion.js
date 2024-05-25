function validateForm(event) {
    event.preventDefault(); // Prevenir el envío del formulario por defecto

    // Validar el nombre de usuario
    var username = document.getElementById("username").value;
    if (username.length < 3 || username.length > 20) {
        document.getElementById("usernameError").style.display = "block";
        return false;
    } else {
        document.getElementById("usernameError").style.display = "none";
    }

    // Validar la contraseña
    var password = document.getElementById("password").value;
    if (password.length < 8) {
        document.getElementById("passwordError").style.display = "block";
        return false;
    } else {
        document.getElementById("passwordError").style.display = "none";
    }

    // Redirigir a otra página si la validación es exitosa
    window.location.href = "./proyectos.html";
    return false; // Evitar que el formulario se envíe de la forma tradicional
}

// Asociar la función validateForm al evento onsubmit del formulario
document.querySelector("form").addEventListener("submit", validateForm);
