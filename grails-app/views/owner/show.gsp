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
        <h4 class="mb-0"><i class="fas fa-user"></i> Owner Details</h4>
    </div>

    <div class="card-body">
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong>Name:</strong> ${this.owner.toString()}
            </li>
            <li class="list-group-item"><strong>Contact Number:</strong> ${this.owner.contactNumber}</li>
            <li class="list-group-item"><strong>Address:</strong> ${this.owner.address}</li>
        </ul>
    </div>
</div>

<div class="d-flex justify-content-start mt-3">
    <g:link controller="owner" action="edit" id="${this.owner.id}" class="btn btn-primary me-2">
        <i class="fas fa-edit"></i> Edit
    </g:link>
    <g:link controller="owner" action="index" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i> Back
    </g:link>
</div>
</body>
</html>