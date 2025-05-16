package com.petclinic

import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j
import grails.plugin.springsecurity.annotation.Secured

@Slf4j
@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class OwnerController {
    def ownerService
    static scaffolding = Owner

    def index() {
        def owners = ownerService.listOwners()
        render view: 'index', model: [owners: owners]
    }

    def create() {
        render view: '/owner/create', model: [owner: new Owner()]
    }

    def save() {
        def result = ownerService.createOwner(params)
        def owner = result.owner
        if (result.success) {
            flash.message = "Owner ${owner.firstName} ${owner.lastName} created successfully"
            redirect action: 'index'
        } else {
            flash.error = "Some of the field needs to be corrected!!"
            // Pass both the owner instance and the original params to preserve form values
            render view: '/owner/create', model: [owner: owner, formParams: params]
        }
    }

    def show() {
        def owner = ownerService.getOwner(params.id as Long)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        render view: '/owner/show', model: [owner: owner]
    }

    def edit() {
        def owner = ownerService.getOwner(params.id as Long)
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        render view: '/owner/edit', model: [owner: owner]
    }

    @Transactional
    def update() {
        def result = ownerService.updateOwner(params.id as Long, params)
        def owner = result.owner
        if (!owner) {
            flash.message = "Owner not found"
            redirect action: 'index'
            return
        }
        if (result.success) {
            flash.message = "Owner updated successfully"
            redirect action: 'show', id: owner.id
        } else {
            flash.error = "Some of the field needs to be corrected!!"
            // Pass both the owner instance and the original params to preserve form values
            render view: '/owner/edit', model: [owner: owner, formParams: params]
        }
    }

    @Transactional
    def delete() {
        def deleted = ownerService.deleteOwner(params.id as Long)
        if (deleted) {
            flash.message = "Owner deleted successfully"
        }
        redirect action: 'index'
    }
}