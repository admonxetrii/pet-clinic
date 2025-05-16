package com.petclinic

import grails.converters.JSON
import com.petclinic.Visit
import com.petclinic.Pet
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class DashboardController {
    def dashboardService
    def springSecurityService

    def index() {
        def currentUser = springSecurityService.currentUser
        render view: 'index', model: [data: dashboardService.getModel(), currentUser: currentUser]
    }
}