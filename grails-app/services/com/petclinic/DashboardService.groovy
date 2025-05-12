package com.petclinic

import grails.converters.JSON

import java.time.LocalDate
import java.time.format.DateTimeFormatter

class DashboardService {

    def getModel() {
        def data = [
                totalPets  : Pet.count(),
                totalOwners: Owner.count(),
                totalVisits: Visit.count(),
                petTypes   : getPetTypes(),
                weeklyVisit: getWeeklyVisits()
        ]

        data.petTypes = petTypes.toString()
        data.weeklyVisit = weeklyVisits.toString()
        return data
    }

    def toUtilDate(localDate) {
        java.util.Date.from(localDate.atStartOfDay(java.time.ZoneId.systemDefault()).toInstant())
    }

    def getWeeklyVisits() {
        def today = LocalDate.now()
        def dates = (0..6).collect { today.minusDays(it) }.reverse()
        def dateLabels = dates.collect { it.format(DateTimeFormatter.ofPattern('yyyy-MM-dd')) }
        def petTypes = Pet.executeQuery('select distinct p.type from Pet p')
        def series = petTypes.collect { petType ->
            def data = dates.collect { date ->
                Visit.executeQuery('select count(v) from Visit v where v.pet.type = :type and v.visitDate >= :start and v.visitDate < :end', [
                    type: petType,
                    start: toUtilDate(date),
                    end: toUtilDate(date.plusDays(1))
                ])[0] ?: 0
            }
            def result = [name: petType, data: data]
            return result
        }
        def result = [date: dateLabels, series: series]
        return result as JSON
    }

    def getPetTypes() {
        def petTypes = Pet.createCriteria().list {
            projections {
                groupProperty('type')
                count('id')
            }
            order('type')
        }
        // Convert Java arrays to Groovy lists for proper JSON serialization
        def result = petTypes.collect {
            [name: it[0], y: it[1]]
        }

        return result as JSON
    }
}