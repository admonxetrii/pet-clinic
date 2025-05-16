package pet.clinic

class UrlMappings {
    static mappings = {
        "/"(controller: 'dashboard', action: 'index')
        "/dashboard"(controller: 'dashboard', action: 'index')
        
        "/login"(controller: 'login', action: 'auth')
        "/logout"(controller: 'logout', action: 'index')
        "/register"(controller: 'register', action: 'index')

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
