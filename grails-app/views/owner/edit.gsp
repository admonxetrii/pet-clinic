<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Edit Owner</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Owner</h2>
        
        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${owner}">
            <div class="alert alert-danger">
                <g:eachError bean="${owner}" var="error">
                    <p>${error.field}: ${error.message}</p>
                </g:eachError>
            </div>
        </g:hasErrors>

        <g:form controller="owner" action="update">
            <g:hiddenField name="id" value="${owner?.id}"/>
            <div class="form-group">
                <label for="firstName">First Name</label>
                <g:textField name="firstName" value="${owner?.firstName}" required="" class="form-control" pattern="[A-Za-z ]+" inputmode="text" title="Only letters and spaces are allowed."/>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <g:textField name="lastName" value="${owner?.lastName}" required="" class="form-control" pattern="[A-Za-z ]+" inputmode="text" title="Only letters and spaces are allowed."/>
            </div>
            <div class="form-group">
                <label for="contactNumber">Contact Number</label>
                <g:textField name="contactNumber" value="${owner?.contactNumber}" required="" class="form-control" pattern="\d{10}" inputmode="numeric" maxlength="10" title="Enter a 10 digit phone number (numbers only)"/>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <g:textField name="address" value="${owner?.address}" required="" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <g:textField name="city" value="${owner?.city}" required="" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="telephone">Telephone</label>
                <g:textField name="telephone" value="${owner?.telephone}" required="" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Update Owner</button>
            <g:link controller="owner" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</body>
</html>
