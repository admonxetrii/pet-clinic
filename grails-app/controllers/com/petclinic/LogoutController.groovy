package com.petclinic

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import javax.servlet.http.HttpServletResponse

@Secured('permitAll')
class LogoutController {

    def index() {
        if (!request.post && SpringSecurityUtils.securityConfig.logout.postOnly) {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, 'Logout requires POST')
            return
        }
        
        // This will be handled by Spring Security's LogoutFilter
        redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
    }
}
