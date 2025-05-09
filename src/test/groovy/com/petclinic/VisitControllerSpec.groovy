package com.petclinic

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class VisitControllerSpec extends Specification implements ControllerUnitTest<VisitController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
