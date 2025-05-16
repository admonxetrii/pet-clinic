<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Register - Pet Clinic</title>
    <asset:stylesheet src="sb-admin-2.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <style>
        .bg-register-image {
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
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                    </div>
                                    
                                    <g:if test="${flash.error}">
                                        <div class="alert alert-danger">${flash.error}</div>
                                    </g:if>
                                    
                                    <form class="user" action="${createLink(controller: 'register', action: 'register')}" method="POST" id="registerForm">
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <input type="text" class="form-control form-control-user" name="firstName" id="firstName"
                                                    placeholder="First Name">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control form-control-user" name="lastName" id="lastName"
                                                    placeholder="Last Name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" name="username" id="username"
                                                placeholder="Username" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" name="email" id="email"
                                                placeholder="Email Address" required>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <input type="password" class="form-control form-control-user" name="password" id="password"
                                                    placeholder="Password" required>
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="password" class="form-control form-control-user" name="confirmPassword" id="confirmPassword"
                                                    placeholder="Repeat Password" required>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            Register Account
                                        </button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="#">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <g:link class="small" controller="login" action="auth">Already have an account? Login!</g:link>
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
