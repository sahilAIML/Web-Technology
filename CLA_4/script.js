function togglePassword() {

    const password =
        document.getElementById("password");

    const button =
        document.querySelector(".eye-button");


    if (password.type === "password") {

        password.type = "text";

        button.textContent = "🙈";

    } else {

        password.type = "password";

        button.textContent = "👁";

    }

}


function validateLogin() {

    const email =
        document.getElementById("email").value.trim();

    const password =
        document.getElementById("password").value.trim();


    if (email === "") {

        alert("Please enter your email.");

        return false;

    }


    if (password === "") {

        alert("Please enter your password.");

        return false;

    }


    return true;

}