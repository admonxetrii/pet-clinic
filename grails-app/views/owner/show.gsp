<%--
  Created by IntelliJ IDEA.
  User: nisham.wagle
  Date: 07/05/2025
  Time: 4:39 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'owner.details', default: 'Owner')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Owner Details</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="edit" id="${this.owner.id}"><i
            class="fas fa-edit fa-sm text-white-50"></i> <g:message code="default.edit.label"
                                                                    args="[entityName]"/></g:link>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info">${flash.message}</div>
</g:if>
<g:if test="${flash.error}">
    <div class="alert alert-danger">${flash.error}</div>
</g:if>
<g:if test="${this.owner.id == null}">
    <div class="alert alert-danger">Owner data is missing.</div>
</g:if>
<g:hasErrors bean="${this.owner}">
    <ul class="errors" role="alert">
        <g:eachError bean="${this.owner}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<div class="card shadow mb-4">
    <div class="card-header bg-primary text-white">
        <h4 class="mb-0"><i class="fas fa-user"></i> ${this.owner.toString()}</h4>
    </div>

    <div class="card-body">
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong>Contact Number:</strong> ${this.owner.contactNumber}</li>
            <li class="list-group-item"><strong>Address:</strong> ${this.owner.address}</li>
        </ul>
    </div>
</div>

<div class="card shadow mb-4">
    <div class="card-header d-sm-flex align-items-center justify-content-between py-3">
        <h6 class="m-0 font-weight-bold text-primary">List of Pets</h6>
        <g:link class="d-none d-sm-inline-block btn btn-sm btn-outline-primary shadow-sm" controller="pet"
                action="create" params="[ownerId: this.owner.id]"><i
                class="fas fa-plus fa-sm"></i> Add Pet</g:link>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-responsive-lg table-bordered" id="dataTable">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Age</th>
                    <th>Owner</th>
                    <th>Visits</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${this.owner.pets}" var="pet">
                    <tr>
                        <td>
                            <g:link controller="pet" action="show" id="${pet.id}" class="text-primary font-weight-bold">
                                ${pet.name}
                            </g:link>
                        </td>
                        <td>${pet.type}</td>
                        <td>${pet.age}</td>
                        <td>${pet.owner.firstName} ${pet.owner.lastName}</td>
                        <td>${pet.visits?.size() ?: 0}</td>
                        <td>
                            <g:link controller="pet" action="show" id="${pet.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-eye"></i>
                            </g:link>
                            <g:link controller="pet" action="edit" id="${pet.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </g:link>
                            <a href="#" class="btn btn-sm btn-danger openDeletePetModal" data-id="${pet.id}"
                               data-pet-name="${pet.name}" data-owner-id="${this.owner.id}" data-toggle="modal" data-target="#deletePetModal"><i
                                    class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Delete Modal-->
<div class="modal fade" id="deletePetModal" tabindex="-1" role="dialog" aria-labelledby="deletePetModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletePetModalLabel">Are you Sure?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">Select "Delete" below if you are ready to delete pet: <br/> "<span
                    class="font-weight-bold" id="petNameGoesHere"></span>".</div>

            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger petIdGoesHere" href="">
                    Delete
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).on("click", ".openDeletePetModal", function () {
        const petId = $(this).data('id');
        const petName = $(this).data('pet-name');
        const ownerId = $(this).data('owner-id');
        const uri = '${createLink(uri:'/pet/delete/')}' + petId + '?ownerId=' + ownerId;
        $("#petNameGoesHere").html(petName);
        $(".petIdGoesHere").attr('href', uri);
    });
</script>
</body>
</html>