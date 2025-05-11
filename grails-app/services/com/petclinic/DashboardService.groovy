package com.petclinic

import grails.converters.JSON

class DashboardService {

    def getModel() {
        def data = [
                totalPets  : Pet.count(),
                totalOwners: Owner.count(),
                totalVisits: Visit.count(),
                petTypes: getPetTypes()
        ]

        return data
    }

    def getPetTypes() {
    def petTypes = Pet.createCriteria().list {
        projections {
            groupProperty('type')
            count('id')
        }
        order('type')
    }
    // Convert Java arrays to Groovy lists for proper JSON serialization
    return petTypes.collect { it instanceof Object[] ? it.toList() : it }
}
}