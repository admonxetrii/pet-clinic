package com.petclinic

import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j

@Slf4j
class OwnerController {
    static scaffolding = Owner

    def index() {
        def owners = Owner.list()
        render view: 'index', model: [owners: owners]
    }

    def create() {
        render view: '/owner/create', model: [owner: new Owner()]
    }

    def save() {
        def owner = new Owner(params)
        if (owner.validate() && owner.save()) {
            flash.message = "Owner ${owner.firstName} ${owner.lastName} created successfully"
            redirect action: 'index'
        } else {
            flash.error = "Some of the field needs to be corrected!!"
            render view: '/owner/create', model: [owner: owner]
        }
    }

    def show() {
        def owner = Owner.get(params.id)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        render view: '/owner/show', model: [owner: owner]
    }

    def edit() {
        def owner = Owner.get(params.id)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        render view: '/owner/edit', model: [owner: owner]
    }

    @Transactional
    def update() {
        def owner = Owner.get(params.id)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        log.info("Update Successful")

        owner.properties = params
        if (owner.validate() && owner.save(flush: true)) {
            flash.message = "Owner updated successfully"
            redirect action: 'show', id: owner.id
        } else {
            render view: '/owner/edit', model: [owner: owner]
        }
    }

    @Transactional
    def delete() {
        def owner = Owner.get(params.id)
        if (owner) {
            owner.delete(flush: true)
            flash.message = "Owner deleted successfully"
        }
        redirect action: 'index'
    }
}