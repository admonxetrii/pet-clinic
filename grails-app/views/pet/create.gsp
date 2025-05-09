<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Create Pet</title>
</head>
<body>
<div class="container mt-5">
    <h2>Create Pet</h2>

    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${pet}">
        <div class="alert alert-danger">
            <g:eachError bean="${pet}" var="error">
                <p>${error.field}: ${error.message}</p>
            </g:eachError>
        </div>
    </g:hasErrors>

    <g:form controller="pet" action="save">
        <div class="form-group">
            <label for="name">Name</label>
            <g:textField name="name" value="${pet?.name}" required="" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="dateOfBirth">Date of Birth</label>
            <g:datePicker name="dateOfBirth" value="${pet?.dateOfBirth}" required="" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="type">Type</label>
            <g:select name="type" from="['Dog', 'Cat', 'Bird', 'Rabbit', 'Fish', 'Other']"
                      value="${pet?.type}" required="" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="owner">Owner</label>
            <g:select name="owner.id" from="${owners}" optionKey="id"
                      optionValue="${(owner) -> "${owner.firstName} ${owner.lastName}"}"
                      value="${pet?.owner?.id}" required="" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary">Create Pet</button>
        <g:link controller="pet" action="index" class="btn btn-secondary">Cancel</g:link>
    </g:form>
</div>
</body>
</html>