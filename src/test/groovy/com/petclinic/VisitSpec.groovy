package com.petclinic

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class VisitSpec extends Specification implements DomainUnitTest<Visit> {

     void "test domain constraints"() {
        when:
        Visit domain = new Visit()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
