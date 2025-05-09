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
    <title>Owner Details</title>
</head>

<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <div class="nav" role="navigation">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                                       args="['Owner']"/></g:link></li>
                    <li><a class="create" href="${createLink(uri: "/owner/edit/${this.owner.id}")}"><g:message
                            code="default.edit.label"
                            args="['Owner']"/></a></li>
                </ul>
            </div>
        </section>

        <h2>Owner Details</h2>

        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <g:if test="${this.owner.id == null}">
            <div class="alert alert-danger">data is null</div>
        </g:if>

        <g:hasErrors bean="${this.owner}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.owner}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${this.owner.firstName} ${this.owner.lastName}</h5>

                <p class="card-text">
                    <strong>Contact Number:</strong> ${this.owner.contactNumber}<br>
                    <strong>Address:</strong> ${this.owner.address}
                </p>
            </div>
        </div>

        <div class="card mt-4">
            <div class="card-header">
                <h5 class="mb-0">Pets</h5>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Age</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${this.owner.pets}" var="pet">
                            <tr>
                                <td>${pet.name}</td>
                                <td>${pet.type}</td>
                                <td>${pet.age}</td>
                                <td>
                                    <g:link controller="pet" action="show" id="${pet.id}" class="btn btn-sm btn-info">
                                        <i class="fas fa-eye"></i>
                                    </g:link>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="mt-4">
            <g:link controller="owner" action="edit" id="${this.owner.id}" class="btn btn-primary">
                <i class="fas fa-edit"></i> Edit
            </g:link>
            <g:link controller="owner" action="index" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back
            </g:link>
        </div>
    </div>
</div>
</body>
</html>