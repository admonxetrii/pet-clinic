package com.petclinic

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.WebAttributes

@Secured('permitAll')
class LoginController {

    def springSecurityService
    def authenticationTrustResolver

    def auth() {
        def conf = getConf()

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }

        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: 'auth', model: [postUrl: postUrl,
                                     rememberMeParameter: conf.rememberMe.parameter,
                                     usernameParameter: conf.apf.usernameParameter,
                                     passwordParameter: conf.apf.passwordParameter,
                                     gspLayout: conf.gsp.layoutAuth]
    }

    def authfail() {
        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = 'Account expired'
            } else if (exception instanceof CredentialsExpiredException) {
                msg = 'Password expired'
            } else if (exception instanceof DisabledException) {
                msg = 'Account disabled'
            } else if (exception instanceof LockedException) {
                msg = 'Account locked'
            } else {
                msg = 'Invalid username or password'
            }
        }

        flash.message = msg
        redirect action: 'auth', params: params
    }

    def denied() {
        if (springSecurityService.isLoggedIn() && authenticationTrustResolver.isRememberMe(SecurityContextHolder.context?.authentication)) {
            redirect action: 'auth', params: params
        }
    }

    protected Map getConf() {
        SpringSecurityUtils.securityConfig
    }
}
