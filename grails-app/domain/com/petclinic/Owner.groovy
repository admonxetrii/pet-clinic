package com.petclinic

class Owner {
    String firstName
    String lastName
    String contactNumber
    String address

    static hasMany = [pets: Pet]

    String toString() {
        return "${firstName} ${lastName}"
    }

    static constraints = {
        firstName blank: false, nullable: false, matches: /^[A-Za-z ]+$/
        lastName blank: false, nullable: false, matches: /^[A-Za-z ]+$/
        contactNumber blank: false, nullable: false, maxSize: 10, minSize: 10, matches: /^\d{10}+$/, unique: true
        address blank: false, nullable: false, maxSize: 255, minSize: 4
    }
}