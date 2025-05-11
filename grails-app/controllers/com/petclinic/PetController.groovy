package com.petclinic

import grails.gorm.transactions.Transactional


class PetController {
    def petService
    static scaffold = Pet

    def index() {
        def pets = petService.listPets()
        render view: 'index', model: [pets: pets]
    }

    def create() {
        def owners = Owner.list()
        render view: 'create', model: [pet: new Pet(), owners: owners]
    }

    def save() {
        def result = petService.createPet(params)
        def pet = result.pet
        if (result.success) {
            flash.message = "Pet ${pet.name} created successfully"
            redirect action: 'index'
        } else {
            render view: 'create', model: [pet: pet, owners: Owner.list()]
        }
    }

    def show() {
        def pet = petService.getPet(params.id as Long)
        if (!pet) {
            flash.message = "Pet not found"
            redirect action: 'index'
            return
        }
        render view: 'show', model: [pet: pet]
    }

    def edit() {
        def pet = petService.getPet(params.id as Long)
        if (!pet) {
            flash.message = "Pet not found"
            redirect action: 'index'
            return
        }
        render view: 'edit', model: [pet: pet, owners: Owner.list()]
    }

    @Transactional
    def update() {
        def result = petService.updatePet(params.id as Long, params)
        def pet = result.pet
        if (!pet) {
            flash.message = "Pet not found"
            redirect action: 'index'
            return
        }
        if (result.success) {
            flash.message = "Pet updated successfully"
            redirect action: 'show', id: pet.id
        } else {
            render view: 'edit', model: [pet: pet, owners: Owner.list()]
        }
    }

    @Transactional
    def delete() {
        def deleted = petService.deletePet(params.id as Long)
        if (deleted) {
            flash.message = "Pet deleted successfully"
        }
        redirect action: 'index'
    }
}