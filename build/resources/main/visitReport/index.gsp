<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'visitReport.details', default: 'Visit')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Reports</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Total Visit Reports</h6>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-responsive-lg table-bordered" id="dataTable">
                <thead>
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
                %{--                <tfoot>--}%
                %{--                <tr>--}%
                %{--                    <th>Name</th>--}%
                %{--                    <th>Contact Number</th>--}%
                %{--                    <th>Address</th>--}%
                %{--                    <th>Pets</th>--}%
                %{--                    <th>Actions</th>--}%
                %{--                </tr>--}%
                %{--                </tfoot>--}%
                <tbody>
                <g:each in="${report}" var="row">
                    <tr>
                        <td>${row.visitId}</td>
                        <td>${row.visitDate}</td>
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
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/2.3.0/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.3.0/js/dataTables.bootstrap4.js"></script>
<script src="https://cdn.datatables.net/buttons/3.2.3/js/dataTables.buttons.js"></script>
<script src="https://cdn.datatables.net/buttons/3.2.3/js/buttons.bootstrap4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/3.2.3/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/3.2.3/js/buttons.print.min.js"></script>

<script>
    $('#dataTable').DataTable({
        layout: {
            topStart: {
                buttons: ['csv', 'excel', 'pdf']
            }
        }
    });
</script>
</body>
</html>
