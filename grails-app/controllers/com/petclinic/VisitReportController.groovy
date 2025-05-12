package com.petclinic

class VisitReportController {
    def visitReportService

    def index() {
        def report = visitReportService.getVisitReport()
        render view: 'index', model: [report: report]
    }
}
