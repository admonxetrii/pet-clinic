<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Visits</title>
</head>
<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Visits</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="create"><i
            class="fas fa-plus fa-sm text-white-50"></i> New Visit</g:link>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">List of Visits</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-responsive-lg table-bordered" id="dataTable">
                <thead>
                <tr>
                    <th>Pet</th>
                    <th>Owner</th>
                    <th>Visit Date</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${visits}" var="visit">
                    <tr>
                        <td>
                            <g:link controller="visit" action="show" id="${visit.id}" class="text-primary font-weight-bold">
                                ${visit.pet.name}
                            </g:link>
                        </td>
                        <td>${visit.pet.owner.toString()}</td>
                        <td>${visit.visitDate}</td>
                        <td>${visit.description}</td>
                        <td>
                            <g:link controller="visit" action="show" id="${visit.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-eye"></i>
                            </g:link>
                            <g:link controller="visit" action="edit" id="${visit.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </g:link>
                            <a href="#" class="btn btn-sm btn-danger openDeleteVisitModal" data-id="${visit.id}" data-visit-desc="${visit.description}" data-toggle="modal" data-target="#deleteVisitModal"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Delete Modal-->
<div class="modal fade" id="deleteVisitModal" tabindex="-1" role="dialog" aria-labelledby="deleteVisitModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteVisitModalLabel">Are you Sure?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">Select "Delete" below if you are ready to delete visit: <br/> "<span class="font-weight-bold" id="visitDescGoesHere"></span>".</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger visitIdGoesHere" href="">
                    Delete
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).on("click", ".openDeleteVisitModal", function () {
        const visitId = $(this).data('id');
        const visitDesc = $(this).data('visit-desc');
        const uri = '${createLink(uri:'/visit/delete/')}' + visitId;
        $("#visitDescGoesHere").html(visitDesc);
        $(".visitIdGoesHere").attr('href', uri);
    });
</script>
</body>
</html>