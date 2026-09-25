<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

    /*
     * =====================================================
     * LOGOUT
     * =====================================================
     */

    String logout = request.getParameter("logout");

    if ("true".equals(logout)) {

        // Destroy session
        session.invalidate();

        // Go back to login page
        response.sendRedirect("login.html");

        return;
    }


    /*
     * =====================================================
     * GET LOGIN DATA
     * =====================================================
     */

    String email = request.getParameter("email");

    String password = request.getParameter("password");


    /*
     * =====================================================
     * LOGIN
     * =====================================================
     */

    if (email != null && password != null) {


        /*
         * TEMPORARY LOGIN
         *
         * Email:
         * sahil@gmail.com
         *
         * Password:
         * 123456
         */

        if (email.equals("sahil@gmail.com")
                && password.equals("123456")) {


            /*
             * LOGIN SUCCESS
             *
             * Save information in session
             */

            session.setAttribute(
                "loggedIn",
                true
            );

            session.setAttribute(
                "userEmail",
                email
            );


        } else {


            /*
             * LOGIN FAILED
             */

%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Login Failed</title>

    <link rel="stylesheet" href="style.css">

</head>

<body>

<div class="container">

    <div class="card">

        <div class="icon error">
            ❌
        </div>

        <h1>
            Login Failed
        </h1>

        <p class="subtitle">
            Invalid email or password.
        </p>

        <button
            class="login-button"
            onclick="window.location.href='login.html'">

            Try Again

        </button>

    </div>

</div>

</body>

</html>

<%

            return;

        }

    }


    /*
     * =====================================================
     * CHECK SESSION
     * =====================================================
     */

    Boolean loggedIn =
        (Boolean) session.getAttribute("loggedIn");


    /*
     * If user is not logged in,
     * redirect to login.html
     */

    if (loggedIn == null || !loggedIn) {

        response.sendRedirect("login.html");

        return;
    }


    /*
     * =====================================================
     * GET USER INFORMATION
     * =====================================================
     */

    String userEmail =
        (String) session.getAttribute("userEmail");

%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Home</title>

    <link rel="stylesheet" href="style.css">

</head>

<body>

<div class="container">

    <div class="card home-card">


        <!-- Success Icon -->

        <div class="icon success">
            ✅
        </div>


        <!-- Success Message -->

        <h1>
            Login Successful!
        </h1>


        <p class="subtitle">
            Welcome to the home page
        </p>


        <!-- User Information -->

        <div class="user-info">

            <h3>
                User Information
            </h3>


            <p>
                <strong>Email:</strong>

                <%= userEmail %>

            </p>


            <p>
                <strong>Status:</strong>

                <span class="status">
                    Logged In
                </span>

            </p>

        </div>


        <!-- Logout -->

        <form
            action="index.jsp"
            method="get">

            <input
                type="hidden"
                name="logout"
                value="true"
            >


            <button
                type="submit"
                class="logout-button">

                Logout

            </button>

        </form>


    </div>

</div>

</body>

</html>