package com.petclinic

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.gorm.transactions.Transactional

@Secured('permitAll')
class RegisterController {

    def springSecurityService

    def index() {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
            return
        }
        render view: 'index'
    }

    @Transactional
    def register() {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
            return
        }

        if (params.password != params.confirmPassword) {
            flash.error = "Passwords do not match"
            redirect action: 'index'
            return
        }

        // Encode the password before creating the user
        String encodedPassword = springSecurityService.encodePassword(params.password)
        
        def user = new User(
                username: params.username,
                password: encodedPassword,
                email: params.email,
                firstName: params.firstName,
                lastName: params.lastName,
                enabled: true
        )

        if (!user.validate() || !user.save(flush: true)) {
            flash.error = "Registration failed: ${user.errors.allErrors.collect { message(error: it) }.join(', ')}"
            redirect action: 'index'
            return
        }

        // Assign ROLE_USER to the new user
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true)
        UserRole.create(user, userRole, true)

        flash.message = "Registration successful! Please login."
        redirect controller: 'login', action: 'auth'
    }
}
