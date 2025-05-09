package com.petclinic


class DashboardController {
    def dashboardService

    def index() {
        render view: 'index', model: [data: dashboardService.getModel()]
    }
}