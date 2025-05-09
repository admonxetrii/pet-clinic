package com.petclinic

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class OwnerServiceSpec extends Specification implements ServiceUnitTest<OwnerService> {

     void "test something"() {
        expect:
        service.doSomething()
     }
}
