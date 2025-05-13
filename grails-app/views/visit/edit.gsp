<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Edit Visit</title>
</head>
<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Edit Visit</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="index"><i
            class="fas fa-list fa-sm text-white-50"></i> Visit List</g:link>
</div>
<div class="card mb-4">
    <div class="card-header">Edit Visit Details</div>
    <div class="card-body">
        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.visit}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.visit}" var="error">
                    <li class="text-danger" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form controller="visit" action="update">
            <g:hiddenField name="id" value="${this.visit?.id}"/>
            <div class="row gx-3 mb-3">
                <div class="col-md-6">
                    <label class="small mb-1" for="inputVisitPet">Pet</label>
                    <g:select id="inputVisitPet" name="pet.id" from="${pets}" optionKey="id" optionValue="${(pet) -> "${pet.name} (${pet.type})"}" value="${this.visit?.pet?.id}" required="" class="form-control"/>
                </div>
                <div class="col-md-6">
                    <label class="small mb-1" for="inputVisitDate">Visit Date</label>
                    <input type="date" id="inputVisitDate" name="visitDate" value="${this.visit?.visitDate instanceof java.util.Date ? new java.text.SimpleDateFormat('yyyy-MM-dd').format(this.visit?.visitDate) : this.visit?.visitDate}" max="${new java.text.SimpleDateFormat('yyyy-MM-dd').format(new Date())}" required class="form-control" />
                </div>
            </div>
            <div class="mb-3">
                <label class="small mb-1" for="inputVisitDescription">Description</label>
                <g:textArea id="inputVisitDescription" name="description" value="${this.visit?.description}" required="" class="form-control" placeholder="Describe the visit"/>
            </div>
            <button type="submit" class="btn btn-primary">Update Visit</button>
            <g:link controller="visit" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</div>