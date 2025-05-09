package com.petclinic

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class PetControllerSpec extends Specification implements ControllerUnitTest<PetController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
