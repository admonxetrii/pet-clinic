<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="index"><i
            class="fas fa-list fa-sm text-white-50"></i> <g:message code="default.list.label"
                                                                    args="[entityName]"/></g:link>
</div>
<div class="card mb-4">
    <div class="card-header">Owner Details</div>

    <div class="card-body">
        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <g:hasErrors bean="${this.owner}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.owner}" var="error">
                    <li class="text-danger" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form controller="owner" action="save">
            <!-- Form Row-->
            <div class="row gx-3 mb-3">
                <!-- Form Group (first name)-->
                <div class="col-md-6">
                    <label class="small mb-1" for="inputFirstName">First name</label>
                    <g:textField id="inputFirstName" name="firstName" value="${formParams?.firstName ?: owner?.firstName}" required=""
                                 class="form-control"
                                 pattern="[A-Za-z ]+" minSize="3" inputmode="text" placeholder="Enter your first name"/>
                    <div class="invalid-feedback">
                        Please enter your first name.
                    </div>
                </div>
                <!-- Form Group (last name)-->
                <div class="col-md-6">
                    <label class="small mb-1" for="inputLastName">Last name</label>
                    <g:textField id="inputLastName" name="lastName" value="${formParams?.lastName ?: owner?.lastName}" required=""
                                 class="form-control"
                                 pattern="[A-Za-z ]+" inputmode="text" placeholder="Enter your last name"/>
                </div>
            </div>
            <!-- Form Row        -->
            <div class="mb-3">
                <!-- Form Group (phone number)-->
                <label class="small mb-1" for="inputPhone">Phone number</label>
                <g:textField id="inputPhone" name="contactNumber" value="${formParams?.contactNumber ?: owner?.contactNumber}" required=""
                             class="form-control"
                             pattern="[0-9]{10}" inputmode="numeric" maxlength="10" minLength="10"
                             placeholder="Enter a 10 digit phone number (numbers only)"/>
            </div>
            <!-- Form Group (email address)-->
            <div class="mb-3">
                <label class="small mb-1" for="inputEmailAddress">Owner address</label>
                <g:textArea id="inputEmailAddress" name="address" value="${formParams?.address ?: owner?.address}" required=""
                            class="form-control" placeholder="Enter your Address details"/>
            </div>
            <!-- Submit button-->
            <button type="submit" class="btn btn-primary">Create Owner</button>
            <g:link controller="owner" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</div>
</body>
</html>
