package pet.clinic

import com.petclinic.Role
import com.petclinic.User
import com.petclinic.UserRole
import grails.gorm.transactions.Transactional

class BootStrap {

    def springSecurityService
    
    def init = { servletContext ->
        initializeSecurityData()
    }
    
    @Transactional
    void initializeSecurityData() {
        // Create default roles if they don't exist
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true)
        
        // Create admin user if it doesn't exist
        def adminUser = User.findByUsername('admin')
        if (!adminUser) {
            // Encode the admin password if springSecurityService is available
            String encodedPassword = 'admin123'
            if (springSecurityService) {
                encodedPassword = springSecurityService.encodePassword('admin123')
            }
            
            adminUser = new User(
                username: 'admin',
                password: encodedPassword,
                email: 'admin@petclinic.com',
                firstName: 'Admin',
                lastName: 'User',
                enabled: true
            ).save(flush: true)
            
            UserRole.create(adminUser, adminRole, true)
        }
    }
    
    def destroy = {
    }
}