<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Create Owner</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Create Owner</h2>
        
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

        <g:form controller="owner" action="save">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <g:textField name="firstName" value="${owner?.firstName}" required="" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name</label>
                <g:textField name="lastName" value="${owner?.lastName}" required="" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="contactNumber">Contact Number</label>
                <g:textField name="contactNumber" value="${owner?.contactNumber}" required="" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <g:textArea name="address" value="${owner?.address}" required="" class="form-control"/>
            </div>

            <button type="submit" class="btn btn-primary">Create Owner</button>
            <g:link controller="owner" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</body>
</html>
