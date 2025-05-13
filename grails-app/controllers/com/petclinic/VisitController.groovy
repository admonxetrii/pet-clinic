package com.petclinic

import grails.gorm.transactions.Transactional

class VisitController {
    def visitService
    static scaffold = Visit

    def index() {
        def visits = visitService.listVisits()
        render view: 'index', model: [visits: visits]
    }

    def create() {
        def pets = Pet.list()
        render view: 'create', model: [visit: new Visit(), pets: pets]
    }

    def save() {
        def result = visitService.createVisit(params)
        def visit = result.visit
        if (result.success) {
            flash.message = "Visit created successfully"
            redirectCheck(params, visit)
        } else {
            render view: 'create', model: [visit: visit, pets: Pet.list()]
        }
    }

    def show() {
        def visit = visitService.getVisit(params.id as Long)
        if (!visit) {
            flash.message = "Visit not found"
            redirect action: 'index'
            return
        }
        render view: 'show', model: [visit: visit]
    }

    def edit() {
        def visit = visitService.getVisit(params.id as Long)
        if (!visit) {
            flash.message = "Visit not found"
            redirect action: 'index'
            return
        }
        render view: 'edit', model: [visit: visit, pets: Pet.list()]
    }

    @Transactional
    def update() {
        def result = visitService.updateVisit(params.id as Long, params)
        def visit = result.visit
        if (!visit) {
            flash.message = "Visit not found"
            redirect action: 'index'
            return
        }
        if (result.success) {
            flash.message = "Visit updated successfully"
            redirectCheck(params, visit)
        } else {
            render view: 'edit', model: [visit: visit, pets: Pet.list()]
        }
    }

    @Transactional
    def delete() {
        def deleted = visitService.deleteVisit(params.id as Long)
        if (deleted) {
            flash.message = "Visit deleted successfully"
        }
        redirect action: 'index'
    }

    def redirectCheck(params, visit) {
        def petId = params?.petId ?: visit?.pet?.id
        if (petId) {
            redirect controller: 'pet', action: 'show', id: petId
        } else {
            redirect action: 'index'
        }
    }
}