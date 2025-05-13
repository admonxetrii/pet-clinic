<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Create Pet</title>
</head>
<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Create Pet</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="index"><i
            class="fas fa-list fa-sm text-white-50"></i> Pet List</g:link>
</div>
<div class="card mb-4">
    <div class="card-header">Pet Details</div>
    <div class="card-body">
        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${pet}">
            <ul class="errors" role="alert">
                <g:eachError bean="${pet}" var="error">
                    <li class="text-danger" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form controller="pet" action="save">
            <div class="row gx-3 mb-3">
                <div class="col-md-6">
                    <label class="small mb-1" for="inputPetName">Name</label>
                    <g:textField id="inputPetName" name="name" value="${pet?.name}" required="" class="form-control" pattern="[A-Za-z ]+" placeholder="Enter pet name"/>
                </div>
                <div class="col-md-6">
                    <label class="small mb-1" for="inputPetType">Type</label>
                    <g:select id="inputPetType" name="type" from="['Dog', 'Cat', 'Bird', 'Rabbit', 'Fish', 'Other']" value="${pet?.type}" required="" class="form-control"/>
                </div>
            </div>
            <div class="row gx-3 mb-3">
                <div class="col-md-6">
                    <label class="small mb-1" for="inputPetDOB">Date of Birth</label>
                    <input type="date" id="inputPetDOB" name="dateOfBirth" value="${pet?.dateOfBirth instanceof java.util.Date ? pet?.dateOfBirth.format('yyyy-MM-dd') : pet?.dateOfBirth}" required class="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="small mb-1" for="inputPetOwner">Owner</label>
                    <g:select id="inputPetOwner" name="owner.id" from="${owners}" optionKey="id" optionValue="${(owner) -> "${owner.firstName} ${owner.lastName}"}" value="${pet?.owner?.id}" required="" class="form-control"/>
                </div>

                <!-- Return to Owner Details if param is available -->
                <g:textField name="ownerId" value="${params.ownerId}" hidden="hidden" />
            </div>
            <button type="submit" class="btn btn-primary">Create Pet</button>
            <g:link controller="pet" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</div>