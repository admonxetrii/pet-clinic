package com.petclinic

class OwnerController {
    static scaffold = Owner

    def index() {
        def owners = Owner.list()
        render view: 'index', model: [owners: owners]
    }

    def create() {
        render view: 'create', model: [owner: new Owner()]
    }

    def save() {
        def owner = new Owner(params)
        if (owner.validate() && owner.save()) {
            flash.message = "Owner ${owner.firstName} ${owner.lastName} created successfully"
            redirect action: 'index'
        } else {
            render view: 'create', model: [owner: owner]
        }
    }

    def show() {
        def owner = Owner.get(params.id)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        render view: 'show', model: [owner: owner]
    }

    def edit() {
        def owner = Owner.get(params.id)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        render view: 'edit', model: [owner: owner]
    }

    def update() {
        def owner = Owner.get(params.id)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }

        owner.properties = params
        if (owner.validate() && owner.save()) {
            flash.message = "Owner updated successfully"
            redirect action: 'show', id: owner.id
        } else {
            render view: 'edit', model: [owner: owner]
        }
    }

    def delete() {
        def owner = Owner.get(params.id)
        if (owner) {
            owner.delete()
            flash.message = "Owner deleted successfully"
        }
        redirect action: 'index'
    }
}
