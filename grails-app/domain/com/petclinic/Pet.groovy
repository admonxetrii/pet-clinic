package com.petclinic

import java.time.LocalDate
import java.time.Period

class Pet {
    String name
    LocalDate dateOfBirth
    String type

    static belongsTo = [owner: Owner]
    static hasMany = [visits: Visit]

    String getAge(){
        def now = LocalDate.now()
        Period period = Period.between( dateOfBirth, now )
        def totalAge = (period.years == 0 ? "" : "${period.years} years, ") + (period.months == 0 ? "" : "${period.months} month, ") + (period.days == 0 ? "" : "${period.days} days.")
        return totalAge
    }

    String toString() {
        return name
    }

    static constraints = {
        name blank: false, nullable: false, matches: /^[A-Za-z ]+$/,
             blankMessage: 'pet.name.blank',
             nullableMessage: 'pet.name.nullable',
             matchesMessage: 'pet.name.matches'
        dateOfBirth blank: false, nullable: false,
                   blankMessage: 'pet.dateOfBirth.blank',
                   nullableMessage: 'pet.dateOfBirth.nullable'
        type blank: false, nullable: false, inList: ["Dog", "Cat", "Bird", "Rabbit", "Fish", "Other"],
             blankMessage: 'pet.type.blank',
             nullableMessage: 'pet.type.nullable',
             inListMessage: 'pet.type.inList'
    }
}