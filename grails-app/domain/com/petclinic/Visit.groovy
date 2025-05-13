package com.petclinic

import java.time.LocalDate

class Visit {
    Pet pet
    LocalDate visitDate
    String description

    static constraints = {
        pet nullable: false,
            nullableMessage: 'visit.pet.nullable'
        visitDate blank: false,
                  blankMessage: 'visit.visitDate.blank'
        description blank: false, maxSize: 1000,
                    blankMessage: 'visit.description.blank',
                    maxSizeMessage: 'visit.description.maxSize'
    }

    static mapping = {
        description type: 'text'
    }
}