<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="container mt-4">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Edit Owner</h1>
            <g:link controller="owner" action="index" class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">
                <i class="fas fa-arrow-left fa-sm text-white-50"></i> Back to Owners
            </g:link>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>
        <g:hasErrors bean="${this.owner}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.owner}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="card shadow mb-4">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0"><i class="fas fa-user-edit"></i> Edit Owner</h4>
            </div>
            <div class="card-body">
                <g:form controller="owner" action="update">
                    <g:hiddenField name="id" value="${this.owner.id}"/>
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3">
                            <label for="firstName" class="form-label">First Name</label>
                            <g:textField name="firstName" value="${this.owner.firstName}" required="" class="form-control" pattern="[A-Za-z ]+" inputmode="text" placeholder="Enter first name" title="Only letters and spaces are allowed."/>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName" class="form-label">Last Name</label>
                            <g:textField name="lastName" value="${this.owner.lastName}" required="" class="form-control" pattern="[A-Za-z ]+" inputmode="text" placeholder="Enter last name" title="Only letters and spaces are allowed."/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3">
                            <label for="contactNumber" class="form-label">Contact Number</label>
                            <g:textField name="contactNumber" value="${this.owner.contactNumber}" required="" class="form-control" pattern="[0-9]{10}" inputmode="numeric" maxlength="10" minlength="10" placeholder="Enter 10 digit phone number" title="Enter a 10 digit phone number (numbers only)"/>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="address" class="form-label">Address</label>
                            <g:textField name="address" value="${this.owner.address}" required="" class="form-control" placeholder="Enter address"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary me-2"><i class="fas fa-save"></i> Update Owner</button>
                        <g:link controller="owner" action="index" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</g:link>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
    </body>
</html>
