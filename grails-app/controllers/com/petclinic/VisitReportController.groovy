package com.petclinic

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class VisitReportController {
    def visitReportService

    def index() {
        def report = visitReportService.getVisitReport()
        render view: 'index', model: [report: report]
    }
}
