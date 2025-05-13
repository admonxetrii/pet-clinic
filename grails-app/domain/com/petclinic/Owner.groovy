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
        firstName blank: false, nullable: false, matches: /^[A-Za-z ]+$/, 
                  blankMessage: 'owner.firstName.blank',
                  nullableMessage: 'owner.firstName.nullable',
                  doesntMatchMessage: 'owner.firstName.matches'
        lastName blank: false, nullable: false, matches: /^[A-Za-z ]+$/,
                 blankMessage: 'owner.lastName.blank',
                 nullableMessage: 'owner.lastName.nullable',
                 doesntMatchMessage: 'owner.lastName.matches'
        contactNumber blank: false, nullable: false, size: 10..10, matches: /^[0-9]{10}$/, unique: true,
                       blankMessage: 'owner.contactNumber.blank',
                       nullableMessage: 'owner.contactNumber.nullable',
                       sizeMessage: 'owner.contactNumber.size',
                       doesntMatchMessage: 'owner.contactNumber.matches',
                       uniqueMessage: 'owner.contactNumber.unique'
        address blank: false, nullable: false, size: 4..255,
                blankMessage: 'owner.address.blank',
                nullableMessage: 'owner.address.nullable',
                sizeMessage: 'owner.address.size'
    }
}