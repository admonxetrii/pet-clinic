package com.petclinic

import groovy.transform.CompileStatic

import java.time.LocalDate
import java.time.format.DateTimeFormatter

@CompileStatic
class VisitReportService {
    def getVisitReport() {
        // Fetch all visits, sorted by date descending
        def visits = Visit.list(sort: 'visitDate', order: 'desc')
        visits.collect { visit ->
            def formattedDate = ''
            if (visit.visitDate instanceof LocalDate) {
                formattedDate = visit.visitDate.format(DateTimeFormatter.ofPattern('yyyy-MM-dd'))
            } else if (visit.visitDate) {
                formattedDate = visit.visitDate.format('yyyy-MM-dd' as DateTimeFormatter)
            }
            [
                visitId: visit.id,
                visitDate: formattedDate,
                description: visit.description,
                petName: visit.pet?.name,
                petType: visit.pet?.type,
                ownerName: visit.pet?.owner?.toString(),
                ownerContact: visit.pet?.owner?.contactNumber
            ]
        }
    }
}
