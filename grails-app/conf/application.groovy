// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.petclinic.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.petclinic.UserRole'
grails.plugin.springsecurity.authority.className = 'com.petclinic.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/login/**',       access: ['permitAll']],
	[pattern: '/logout/**',      access: ['permitAll']],
	[pattern: '/register/**',    access: ['permitAll']],
	[pattern: '/',               access: ['isAuthenticated()']],
	[pattern: '/dashboard/**',   access: ['isAuthenticated()']],
	[pattern: '/owner/**',       access: ['isAuthenticated()']],
	[pattern: '/pet/**',         access: ['isAuthenticated()']],
	[pattern: '/visit/**',       access: ['isAuthenticated()']],
	[pattern: '/visitReport/**', access: ['isAuthenticated()']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

// Use form login
grails.plugin.springsecurity.auth.loginFormUrl = '/login/auth'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/dashboard'
grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/login/auth?login_error=1'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.password.algorithm = 'bcrypt'
grails.plugin.springsecurity.securityConfigType = "Annotation"
