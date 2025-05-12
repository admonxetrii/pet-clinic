package com.petclinic


import grails.converters.JSON
import com.petclinic.Visit
import com.petclinic.Pet

class DashboardController {
    def dashboardService

    def index() {
        render view: 'index', model: [data: dashboardService.getModel()]
    }


}