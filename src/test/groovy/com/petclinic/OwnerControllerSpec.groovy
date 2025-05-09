package com.petclinic

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class OwnerControllerSpec extends Specification implements ControllerUnitTest<OwnerController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
