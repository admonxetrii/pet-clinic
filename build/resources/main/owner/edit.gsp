<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Edit Owner</title>
</head>
<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Edit Owner</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="index"><i
            class="fas fa-list fa-sm text-white-50"></i> Owner List</g:link>
</div>
<div class="card mb-4">
    <div class="card-header">Edit Owner Details</div>
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
                    <li class="text-danger" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form controller="owner" action="update">
            <g:hiddenField name="id" value="${this.owner.id}"/>
            <!-- Form Row-->
            <div class="row gx-3 mb-3">
                <!-- Form Group (first name)-->
                <div class="col-md-6">
                    <label class="small mb-1" for="inputFirstName">First name</label>
                    <g:textField id="inputFirstName" name="firstName" value="${formParams?.firstName ?: this.owner.firstName}" required=""
                                 class="form-control"
                                 pattern="[A-Za-z ]+" inputmode="text" placeholder="Enter your first name"/>
                </div>
                <!-- Form Group (last name)-->
                <div class="col-md-6">
                    <label class="small mb-1" for="inputLastName">Last name</label>
                    <g:textField id="inputLastName" name="lastName" value="${formParams?.lastName ?: this.owner.lastName}" required=""
                                 class="form-control"
                                 pattern="[A-Za-z ]+" inputmode="text" placeholder="Enter your last name"/>
                </div>
            </div>
            <!-- Form Row        -->
            <div class="mb-3">
                <!-- Form Group (phone number)-->
                <label class="small mb-1" for="inputPhone">Phone number</label>
                <g:textField id="inputPhone" name="contactNumber" value="${formParams?.contactNumber ?: this.owner.contactNumber}" required=""
                             class="form-control"
                             pattern="[0-9]{10}" inputmode="numeric" maxlength="10" minLength="10"
                             placeholder="Enter a 10 digit phone number (numbers only)"/>
            </div>
            <!-- Form Group (address)-->
            <div class="mb-3">
                <label class="small mb-1" for="inputAddress">Owner address</label>
                <g:textArea id="inputAddress" name="address" value="${formParams?.address ?: this.owner.address}" required=""
                            class="form-control" placeholder="Enter your Address details"/>
            </div>
            <!-- Submit button-->
            <button type="submit" class="btn btn-primary">Update Owner</button>
            <g:link controller="owner" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</div>
</body>
</html>
