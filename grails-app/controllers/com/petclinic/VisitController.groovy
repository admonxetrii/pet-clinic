package com.petclinic

class VisitController {
    static scaffold = Visit

    def index() {
        def visits = Visit.list()
        render view: 'index', model: [visits: visits]
    }

    def create() {
        def pets = Pet.list()
        render view: 'create', model: [visit: new Visit(), pets: pets]
    }

    def save() {
        def visit = new Visit(params)
        if (visit.validate() && visit.save()) {
            flash.message = "Visit created successfully"
            redirect action: 'index'
        } else {
            render view: 'create', model: [visit: visit, pets: Pet.list()]
        }
    }

    def show() {
        def visit = Visit.get(params.id)
        if (!visit) {
            flash.message = "Visit not found"
            redirect action: 'index'
            return
        }
        render view: 'show', model: [visit: visit]
    }

    def edit() {
        def visit = Visit.get(params.id)
        if (!visit) {
            flash.message = "Visit not found"
            redirect action: 'index'
            return
        }
        render view: 'edit', model: [visit: visit, pets: Pet.list()]
    }

    def update() {
        def visit = Visit.get(params.id)
        if (!visit) {
            flash.message = "Visit not found"
            redirect action: 'index'
            return
        }

        visit.properties = params
        if (visit.validate() && visit.save()) {
            flash.message = "Visit updated successfully"
            redirect action: 'show', id: visit.id
        } else {
            render view: 'edit', model: [visit: visit, pets: Pet.list()]
        }
    }

    def delete() {
        def visit = Visit.get(params.id)
        if (visit) {
            visit.delete()
            flash.message = "Visit deleted successfully"
        }
        redirect action: 'index'
    }
}
