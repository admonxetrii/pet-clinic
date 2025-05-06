package pet.clinic

class UrlMappings {

    static mappings = {
        "/"(controller: 'dashboard', action: 'index')
        "/dashboard"(controller: 'dashboard', action: 'index')
        
        // Owner routes
        "/owner"(controller: 'owner', action: 'index')
        "/owner/create"(controller: 'owner', action: 'create')
        "/owner/save"(controller: 'owner', action: 'save')
        "/owner/show/$id"(controller: 'owner', action: 'show')
        "/owner/edit/$id"(controller: 'owner', action: 'edit')
        "/owner/delete/$id"(controller: 'owner', action: 'delete')
        
        // Pet routes
        "/pet"(controller: 'pet', action: 'index')
        "/pet/create"(controller: 'pet', action: 'create')
        "/pet/save"(controller: 'pet', action: 'save')
        "/pet/show/$id"(controller: 'pet', action: 'show')
        "/pet/edit/$id"(controller: 'pet', action: 'edit')
        "/pet/delete/$id"(controller: 'pet', action: 'delete')
        
        // Visit routes
        "/visit"(controller: 'visit', action: 'index')
        "/visit/create"(controller: 'visit', action: 'create')
        "/visit/save"(controller: 'visit', action: 'save')
        "/visit/show/$id"(controller: 'visit', action: 'show')
        "/visit/edit/$id"(controller: 'visit', action: 'edit')
        "/visit/delete/$id"(controller: 'visit', action: 'delete')
        
        "/$controller/$action?/$id?(.$format)"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
