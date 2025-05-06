<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Pet Clinic Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container mt-5">
        <!-- Statistics Cards -->
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Pets</h5>
                        <h2 class="display-4">${stats.totalPets}</h2>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Owners</h5>
                        <h2 class="display-4">${stats.totalOwners}</h2>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Visits</h5>
                        <h2 class="display-4">${stats.totalVisits}</h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pet Types Chart -->
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Pet Types Distribution</h5>
                <canvas id="petTypesChart"></canvas>
            </div>
        </div>

%{--        <!-- Weekly Visits Chart -->--}%
%{--        <div class="card mb-4">--}%
%{--            <div class="card-body">--}%
%{--                <h5 class="card-title">Weekly Visits</h5>--}%
%{--                <canvas id="weeklyVisitsChart"></canvas>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Recent Visits -->--}%
%{--        <div class="card">--}%
%{--            <div class="card-body">--}%
%{--                <h5 class="card-title">Recent Visits</h5>--}%
%{--                <div class="table-responsive">--}%
%{--                    <table class="table">--}%
%{--                        <thead>--}%
%{--                            <tr>--}%
%{--                                <th>Pet</th>--}%
%{--                                <th>Visit Date</th>--}%
%{--                                <th>Description</th>--}%
%{--                            </tr>--}%
%{--                        </thead>--}%
%{--                        <tbody>--}%
%{--                            <g:each in="${stats.recentVisits}" var="visit">--}%
%{--                                <tr>--}%
%{--                                    <td>${visit.pet.name}</td>--}%
%{--                                    <td>${visit.visitDate.format('yyyy-MM-dd')}</td>--}%
%{--                                    <td>${visit.description}</td>--}%
%{--                                </tr>--}%
%{--                            </g:each>--}%
%{--                        </tbody>--}%
%{--                    </table>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%

        <!-- JavaScript for Charts -->
        <script>
            // Pet Types Chart
            const petTypesCtx = document.getElementById('petTypesChart').getContext('2d');
            const petTypesData = {};
            new Chart(petTypesCtx, {
                type: 'pie',
                data: {
                    labels: petTypesData.map(item => item[0]),
                    datasets: [{
                        data: petTypesData.map(item => item[1]),
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                            'rgba(153, 102, 255, 0.5)',
                            'rgba(255, 159, 64, 0.5)'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        }
                    }
                }
            });

%{--            // Weekly Visits Chart--}%
%{--            const weeklyVisitsCtx = document.getElementById('weeklyVisitsChart').getContext('2d');--}%
%{--            const weeklyVisitsData = ${stats.weeklyVisits as JSON};--}%
%{--            new Chart(weeklyVisitsCtx, {--}%
%{--                type: 'bar',--}%
%{--                data: {--}%
%{--                    labels: weeklyVisitsData.map(item => new Date(item[0]).toLocaleDateString()),--}%
%{--                    datasets: [{--}%
%{--                        label: 'Number of Visits',--}%
%{--                        data: weeklyVisitsData.map(item => item[1]),--}%
%{--                        backgroundColor: 'rgba(54, 162, 235, 0.5)',--}%
%{--                        borderColor: 'rgba(54, 162, 235, 1)',--}%
%{--                        borderWidth: 1--}%
%{--                    }]--}%
%{--                },--}%
%{--                options: {--}%
%{--                    responsive: true,--}%
%{--                    scales: {--}%
%{--                        y: {--}%
%{--                            beginAtZero: true--}%
%{--                        }--}%
%{--                    }--}%
%{--                }--}%
%{--            });--}%
        </script>
    </div>
</body>
</html>
