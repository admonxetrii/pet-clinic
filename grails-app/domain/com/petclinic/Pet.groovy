package com.petclinic

class Pet {
    String name
    Date dateOfBirth
    String type // e.g., Dog, Cat, Bird, etc.
    
    static belongsTo = [owner: Owner]
    static hasMany = [visits: Visit]

    Integer getAge() {
        def now = new Date()
        return now.year - dateOfBirth.year
    }

    String toString() {
        return name
    }

    static constraints = {
        name blank: false
        dateOfBirth blank: false
        type blank: false, inList: ['Dog', 'Cat', 'Bird', 'Rabbit', 'Fish', 'Other']
    }
}
