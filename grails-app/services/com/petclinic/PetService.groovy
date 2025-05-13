package com.petclinic

import grails.gorm.transactions.Transactional

@Transactional
class PetService {
    def listPets() {
        Pet.list()
    }

    def getPet(Long id) {
        Pet.get(id)
    }

    def createPet(Map params) {
        def pet = new Pet(params)
        if (pet.validate() && pet.save()) {
            return [success: true, pet: pet]
        } else {
            return [success: false, pet: pet]
        }
    }

    def updatePet(Long id, Map params) {
        def pet = Pet.get(id)
        if (!pet) return [success: false, pet: null]
        pet.properties = params
        if (pet.validate() && pet.save(flush: true)) {
            return [success: true, pet: pet]
        } else {
            return [success: false, pet: pet]
        }
    }


    def deletePet(Long id) {
        def pet = Pet.get(id)
        if (pet) {
            pet.delete(flush: true)
            return true
        }
        return false
    }
}
