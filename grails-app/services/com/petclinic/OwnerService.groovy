package com.petclinic

import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j

@Slf4j
@Transactional
class OwnerService {
    def listOwners() {
        Owner.list()
    }

    def getOwner(Long id) {
        Owner.get(id)
    }

    def createOwner(Map params) {
        def owner = new Owner(params)
        if (owner.validate() && owner.save()) {
            return [success: true, owner: owner]
        } else {
            return [success: false, owner: owner]
        }
    }

    def updateOwner(Long id, Map params) {
        def owner = Owner.get(id)
        if (!owner) return [success: false, owner: null]
        owner.properties = params
        if (owner.validate() && owner.save(flush: true)) {
            return [success: true, owner: owner]
        } else {
            return [success: false, owner: owner]
        }
    }

    def deleteOwner(Long id) {
        def owner = Owner.get(id)
        if (owner) {
            owner.delete(flush: true)
            return true
        }
        return false
    }
}
