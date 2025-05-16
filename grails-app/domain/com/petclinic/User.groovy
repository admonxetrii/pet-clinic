package com.petclinic

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1
    
    def springSecurityService

    String username
    String password
    String email
    String firstName
    String lastName
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    
    // Password will be encoded by the Spring Security service
    // We'll handle this in the controller instead of the domain class
    // to avoid static type checking issues

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false, password: true
        email nullable: false, blank: false, email: true, unique: true
        firstName nullable: true
        lastName nullable: true
    }

    static mapping = {
	    password column: '`password`'
    }
}
