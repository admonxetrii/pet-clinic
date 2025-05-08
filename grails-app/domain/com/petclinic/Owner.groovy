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
        firstName blank: false, matches: /^[A-Za-z ]+$/
        lastName blank: false, matches: /^[A-Za-z ]+$/
        contactNumber blank: false, matches: /^\d{10}$/
        address blank: false
    }
}
