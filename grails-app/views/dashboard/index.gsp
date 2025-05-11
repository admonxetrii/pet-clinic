<%--
  Created by IntelliJ IDEA.
  User: nisham.wagle
  Date: 07/05/2025
  Time: 2:27 PM
--%>

<%@ page import="grails.converters.JSON" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Pet Clinic Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
    .highcharts-figure,
    .highcharts-data-table table {
        min-width: 320px;
        max-width: 800px;
        margin: 1em auto;
    }

    .highcharts-data-table table {
        font-family: Verdana, sans-serif;
        border-collapse: collapse;
        border: 1px solid #ebebeb;
        margin: 10px auto;
        text-align: center;
        width: 100%;
        max-width: 500px;
    }

    .highcharts-data-table caption {
        padding: 1em 0;
        font-size: 1.2em;
        color: #555;
    }

    .highcharts-data-table th {
        font-weight: 600;
        padding: 0.5em;
    }

    .highcharts-data-table td,
    .highcharts-data-table th,
    .highcharts-data-table caption {
        padding: 0.5em;
    }

    .highcharts-data-table thead tr,
    .highcharts-data-table tbody tr:nth-child(even) {
        background: #f8f8f8;
    }

    .highcharts-data-table tr:hover {
        background: #f1f7ff;
    }

    .highcharts-description {
        margin: 0.3rem 10px;
    }
    </style>
</head>

<body>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
</div>

<!-- Cards Row -->
<div class="row">
    <!-- Total Pets Card -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-gray-900 font-weight-bold text-primary text-uppercase">
                            Total Pets</div>
%{--                        <div class="h5 mb-0 font-weight-bold text-gray-800">${data.totalPets}</div>--}%
                    </div>
                    <div class="col-auto">
                        <div class="text-lg-center font-weight-bold text-primary">${data.totalPets}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container mt-5">
    <!-- Statistics Cards -->
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Total Pets</h5>

                    <h2 class="display-4">${data.totalPets}</h2>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Total Owners</h5>

                    <h2 class="display-4">${data.totalOwners}</h2>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Total Visits</h5>

                    <h2 class="display-4">${data.totalVisits}</h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Pet Types Chart -->
    <div class="col-xl-6 col-lg-6">
        <div class="card shadow mb-6">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <figure class="highcharts-figure">
                    <div id="container"></div>
                </figure>
                <hr>
                Styling for the donut chart can be found in the
                <code>/js/demo/chart-pie-demo.js</code> file.
            </div>
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
        // Pet Types Charts
        const petTypesCtx = document.getElementById('petTypesChart').getContext('2d');
        const petTypesData = JSON.parse('${data.petTypes.encodeAsJSON()}');
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

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script>
        (function (H) {
            H.seriesTypes.pie.prototype.animate = function (init) {
                const series = this,
                    chart = series.chart,
                    points = series.points,
                    {
                        animation
                    } = series.options,
                    {
                        startAngleRad
                    } = series;

                function fanAnimate(point, startAngleRad) {
                    const graphic = point.graphic,
                        args = point.shapeArgs;

                    if (graphic && args) {

                        graphic
                            // Set inital animation values
                            .attr({
                                start: startAngleRad,
                                end: startAngleRad,
                                opacity: 1
                            })
                            // Animate to the final position
                            .animate({
                                start: args.start,
                                end: args.end
                            }, {
                                duration: animation.duration / points.length
                            }, function () {
                                // On complete, start animating the next point
                                if (points[point.index + 1]) {
                                    fanAnimate(points[point.index + 1], args.end);
                                }
                                // On the last point, fade in the data labels, then
                                // apply the inner size
                                if (point.index === series.points.length - 1) {
                                    series.dataLabelsGroup.animate({
                                            opacity: 1
                                        },
                                        void 0,
                                        function () {
                                            points.forEach(point => {
                                                point.opacity = 1;
                                            });
                                            series.update({
                                                enableMouseTracking: true
                                            }, false);
                                            chart.update({
                                                plotOptions: {
                                                    pie: {
                                                        innerSize: '40%',
                                                        borderRadius: 8
                                                    }
                                                }
                                            });
                                        });
                                }
                            });
                    }
                }

                if (init) {
                    // Hide points on init
                    points.forEach(point => {
                        point.opacity = 0;
                    });
                } else {
                    fanAnimate(points[0], startAngleRad);
                }
            };
        }(Highcharts));

        Highcharts.chart('container', {
            chart: {
                type: 'pie'
            },
            title: {
                text: 'Departmental Strength of a Company'
            },
            subtitle: {
                text: 'Custom animation of pie series'
            },
            tooltip: {
                headerFormat: '',
                pointFormat:
                    '<span style="color:{point.color}">\u25cf</span> ' +
                    '{point.name}: <b>{point.percentage:.1f}%</b>'
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    borderWidth: 2,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b><br>{point.percentage}%',
                        distance: 20
                    }
                }
            },
            series: [{
                // Disable mouse tracking on load, enable after custom animation
                enableMouseTracking: false,
                animation: {
                    duration: 2000
                },
                colorByPoint: true,
                data: [{
                    name: 'Cat',
                    y: 1
                }, {
                    name: 'Dog',
                    y: 4
                }]
            }]
        });
    </script>
</div>
</body>
</html>