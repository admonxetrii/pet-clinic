<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Pet Visit Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Total Visits Report</h2>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Visit ID</th>
                <th>Date</th>
                <th>Description</th>
                <th>Pet Name</th>
                <th>Pet Type</th>
                <th>Owner Name</th>
                <th>Owner Contact</th>
            </tr>
        </thead>
        <tbody>
        <g:each in="${report}" var="row">
            <tr>
                <td>${row.visitId}</td>
                <td>${row.visitDate?.format('yyyy-MM-dd')}</td>
                <td>${row.description}</td>
                <td>${row.petName}</td>
                <td>${row.petType}</td>
                <td>${row.ownerName}</td>
                <td>${row.ownerContact}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>
