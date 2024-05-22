function validateForm() {
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

    return true;
}