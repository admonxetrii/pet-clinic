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
        firstName blank: false
        lastName blank: false
        contactNumber blank: false, maxSize: 20
        address blank: false
    }
}
