package com.petclinic

class PetController {
    static scaffold = Pet

    def index() {
        def pets = Pet.list()
        render view: 'index', model: [pets: pets]
    }

    def create() {
        def owners = Owner.list()
        render view: 'create', model: [pet: new Pet(), owners: owners]
    }

    def save() {
        def pet = new Pet(params)
        if (pet.validate() && pet.save()) {
            flash.message = "Pet ${pet.name} created successfully"
            redirect action: 'index'
        } else {
            render view: 'create', model: [pet: pet, owners: Owner.list()]
        }
    }

    def show() {
        def pet = Pet.get(params.id)
        if (!pet) {
            flash.message = "Pet not found"
            redirect action: 'index'
            return
        }
        render view: 'show', model: [pet: pet]
    }

    def edit() {
        def pet = Pet.get(params.id)
        if (!pet) {
            flash.message = "Pet not found"
            redirect action: 'index'
            return
        }
        render view: 'edit', model: [pet: pet, owners: Owner.list()]
    }

    def update() {
        def pet = Pet.get(params.id)
        if (!pet) {
            flash.message = "Pet not found"
            redirect action: 'index'
            return
        }

        pet.properties = params
        if (pet.validate() && pet.save()) {
            flash.message = "Pet updated successfully"
            redirect action: 'show', id: pet.id
        } else {
            render view: 'edit', model: [pet: pet, owners: Owner.list()]
        }
    }

    def delete() {
        def pet = Pet.get(params.id)
        if (pet) {
            pet.delete()
            flash.message = "Pet deleted successfully"
        }
        redirect action: 'index'
    }
}
