package com.petclinic

import java.time.LocalDate

class Visit {
    Pet pet
    LocalDate visitDate
    String description

    static constraints = {
        pet nullable: false
        visitDate blank: false
        description blank: false, maxSize: 1000
    }

    static mapping = {
        description type: 'text'
    }
}