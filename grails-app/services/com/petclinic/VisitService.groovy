package com.petclinic

import grails.gorm.transactions.Transactional

@Transactional
class VisitService {
    def listVisits() {
        Visit.list()
    }

    def getVisit(Long id) {
        Visit.get(id)
    }

    def createVisit(Map params) {
        def visit = new Visit(params)
        if (visit.validate() && visit.save()) {
            return [success: true, visit: visit]
        } else {
            return [success: false, visit: visit]
        }
    }

    def updateVisit(Long id, Map params) {
        def visit = Visit.get(id)
        if (!visit) return [success: false, visit: null]
        visit.properties = params
        if (visit.validate() && visit.save()) {
            return [success: true, visit: visit]
        } else {
            return [success: false, visit: visit]
        }
    }

    def deleteVisit(Long id) {
        def visit = Visit.get(id)
        if (visit) {
            visit.delete()
            return true
        }
        return false
    }
}
