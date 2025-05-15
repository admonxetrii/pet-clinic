<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Visit Details</title>
</head>
<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Visit Details</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="edit" id="${visit.id}"><i class="fas fa-edit fa-sm text-white-50"></i> Edit</g:link>
</div>
<g:if test="${flash.message}">
    <div class="alert alert-info">${flash.message}</div>
</g:if>
<g:if test="${flash.error}">
    <div class="alert alert-danger">${flash.error}</div>
</g:if>
<g:if test="${visit.id == null}">
    <div class="alert alert-danger">Visit data is missing.</div>
</g:if>
<g:hasErrors bean="${visit}">
    <ul class="errors" role="alert">
        <g:eachError bean="${visit}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<div class="card shadow mb-4">
    <div class="card-header bg-info text-white">
        <h4 class="mb-0"><i class="fas fa-notes-medical"></i> Visit for ${visit.pet.name}</h4>
    </div>
    <div class="card-body">
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong>Date:</strong> ${visit.visitDate}</li>
            <li class="list-group-item"><strong>Description:</strong> ${visit.description}</li>
            <li class="list-group-item"><strong>Pet Type:</strong> ${visit.pet.type}</li>
            <li class="list-group-item"><strong>Owner:</strong> ${visit.pet.owner.toString()}</li>
        </ul>
    </div>
</div>
<div class="mt-4">
    <g:link controller="visit" action="edit" id="${visit.id}" params="[fromShow: true]" class="btn btn-primary">
        <i class="fas fa-edit"></i> Edit
    </g:link>
    <g:link controller="visit" action="index" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i> Back
    </g:link>
</div>
</body>
</html>