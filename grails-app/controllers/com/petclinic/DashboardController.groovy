package com.petclinic

class DashboardController {
    def index() {
        // Get statistics for the dashboard
        def stats = [
            totalPets: Pet.count(),
            totalOwners: Owner.count(),
            totalVisits: Visit.count(),
            petTypes: Pet.createCriteria().list {
                projections {
                    groupProperty('type')
                    count('id')
                }
                order('type')
            },
            weeklyVisits: Visit.createCriteria().list {
                def startDate = new Date()
                between('visitDate', startDate, new Date())
                projections {
                    groupProperty('visitDate')
                    count('id')
                }
                order('visitDate')
            },
            recentVisits: Visit.createCriteria().list {
                maxResults(5)
                order('visitDate', 'desc')
            }
        ]

        println "${stats}"
        render view: 'index', model: [stats: stats]
    }
}
