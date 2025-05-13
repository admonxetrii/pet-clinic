<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Pet Details</title>
</head>
<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Pet Details</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="edit" id="${pet.id}"><i class="fas fa-edit fa-sm text-white-50"></i> Edit</g:link>
</div>
<g:if test="${flash.message}">
    <div class="alert alert-info">${flash.message}</div>
</g:if>
<g:if test="${flash.error}">
    <div class="alert alert-danger">${flash.error}</div>
</g:if>
<g:if test="${pet.id == null}">
    <div class="alert alert-danger">Pet data is missing.</div>
</g:if>
<g:hasErrors bean="${pet}">
    <ul class="errors" role="alert">
        <g:eachError bean="${pet}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<div class="card shadow mb-4">
    <div class="card-header bg-success text-white">
        <h4 class="mb-0"><i class="fas fa-paw"></i> ${pet.name}</h4>
    </div>
    <div class="card-body">
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong>Type:</strong> ${pet.type}</li>
            <li class="list-group-item"><strong>Age:</strong> ${pet.age}</li>
            <li class="list-group-item"><strong>Owner:</strong> ${pet.owner.toString()}</li>
        </ul>
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header d-sm-flex align-items-center justify-content-between py-3">
        <h6 class="m-0 font-weight-bold text-primary">List of Visits</h6>
        <g:link class="d-none d-sm-inline-block btn btn-sm btn-outline-primary shadow-sm" controller="visit" action="create" params="[petId: pet.id]"><i class="fas fa-plus fa-sm"></i> Add Visit</g:link>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Visit Date</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${pet.visits}" var="visit">
                    <tr>
                        <td>${visit.visitDate}</td>
                        <td>${visit.description}</td>
                        <td>
                            <g:link controller="visit" action="show" id="${visit.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-eye"></i>
                            </g:link>
                            <g:link controller="visit" action="edit" id="${visit.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </g:link>
                            <a href="#" class="btn btn-sm btn-danger openDeleteVisitModal" data-id="${visit.id}" data-visit-desc="${visit.description}" data-pet-id="${pet.id}" data-toggle="modal" data-target="#deleteVisitModal">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="mt-4">
    <g:link controller="pet" action="edit" id="${pet.id}" class="btn btn-primary">
        <i class="fas fa-edit"></i> Edit
    </g:link>
    <g:link controller="pet" action="index" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i> Back
    </g:link>
</div>

<!-- Delete Visit Modal-->
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
        const petId = $(this).data('pet-id');
        const uri = '${createLink(uri:"/visit/delete/")}' + visitId + '?petId=' + petId;
        $("#visitDescGoesHere").html(visitDesc);
        $(".visitIdGoesHere").attr('href', uri);
    });
</script>
</body>
</html>