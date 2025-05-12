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

    <!-- Total Owner Card -->
    <div class="col-xl-4 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-gray-900 font-weight-bold text-primary text-uppercase mb-2">
                            Total Owners</div>

                        <div class="h1 mb-0 font-weight-bold text-gray-800">${data.totalOwners}</div>
                    </div>

                    <div class="col-auto">
                        <i class="fas fa-user-ninja fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Total Pets Card -->
    <div class="col-xl-4 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-gray-900 font-weight-bold text-primary text-uppercase mb-2">
                            Total Pets</div>

                        <div class="h1 mb-0 font-weight-bold text-gray-800">${data.totalPets}</div>
                    </div>

                    <div class="col-auto">
                        <i class="fas fa-dog fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Total Visits Card -->
    <div class="col-xl-4 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-gray-900 font-weight-bold text-primary text-uppercase mb-2">
                            Total Visits</div>

                        <div class="h1 mb-0 font-weight-bold text-gray-800">${data.totalVisits}</div>
                    </div>

                    <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <!-- Pet Types Chart -->
    <div class="col-xl-4 col-lg-6">
        <div class="card shadow mb-6">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <figure class="highcharts-figure">
                    <div id="total-pets-container"></div>
                </figure>
                <hr>

            </div>
        </div>
    </div>

    <!-- Weekly Visit Graph -->
    <div class="col-xl-8 col-lg-12">
        <div class="card shadow mb-6">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Weekly Visit Count</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <figure class="highcharts-figure">
                    <div id="weekly-visit-container"></div>
                </figure>
                <hr>

            </div>
        </div>
    </div>
</div>


<!-- JavaScript for Charts -->

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
    // Pie Chart
    Highcharts.chart('total-pets-container', {
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Total number of Pets'
        },
        subtitle: {
            text: 'No. of pets based on its type.'
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
                    format: '<b>{point.name}</b><br>Count: {point.y}',
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
            data: ${raw(data.petTypes)}
        }]
    });

    //Bar Graph
    var weeklyVisitData = ${raw(data.weeklyVisit)};
    Highcharts.chart('weekly-visit-container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Total no. of Pet Visits in last 7 days'
        },
        xAxis: {
            categories: weeklyVisitData.date,
            crosshair: true,
            accessibility: {
                description: 'Dates of last 7 days'
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'No. of Visits'
            }
        },
        tooltip: {
            valueSuffix: ' (1000 MT)'
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: weeklyVisitData.series,
    });
</script>
</body>
</html>