package com.petclinic

class Visit {
    Pet pet
    Date visitDate
    String description

    static constraints = {
        pet nullable: false
        visitDate blank: false
        description blank: false, maxSize: 1000, matches: /^[A-Za-z0-9 .,!?-]+$/
    }

    static mapping = {
        description type: 'text'
    }
}
