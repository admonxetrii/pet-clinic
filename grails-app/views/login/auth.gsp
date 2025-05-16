<!DOCTYPE html>
<html>
<head>
%{--    <meta name="layout" content="main"/>--}%
    <title>Login - Pet Clinic</title>
    <asset:stylesheet src="sb-admin-2.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <style>
        .bg-login-image {
            background: url('${assetPath(src: "undraw_pet_clinic.jpg")}');
            background-position: center;
            background-size: cover;
        }
        .bg-gradient-primary {
            background-color: #4e73df;
            background-image: linear-gradient(180deg, #4e73df 10%, #224abe 100%);
            background-size: cover;
        }
    </style>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    
                                    <g:if test="${flash.message}">
                                        <div class="alert alert-danger">${flash.message}</div>
                                    </g:if>
                                    
                                    <form class="user" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" name="${usernameParameter ?: 'username'}" id="username" 
                                                placeholder="Enter Username..." required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="${passwordParameter ?: 'password'}" id="password"
                                                placeholder="Password" required>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me">
                                                <label class="custom-control-label" for="remember_me">Remember Me</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="#">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <g:link class="small" controller="register">Create an Account!</g:link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="bootstrap.bundle.min.js"/>

    <!-- Core plugin JavaScript-->
    <asset:javascript src="jquery.easing.min.js"/>

    <!-- Custom scripts for all pages-->
    <asset:javascript src="sb-admin-2.min.js"/>
</body>
</html>
