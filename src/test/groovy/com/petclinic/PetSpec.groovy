package com.petclinic

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class PetSpec extends Specification implements DomainUnitTest<Pet> {

     void "test domain constraints"() {
        when:
        Pet domain = new Pet()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
