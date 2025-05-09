<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Edit Pet</title>
</head>
<body>
<div class="container mt-5">
    <h2>Edit Pet</h2>

    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${this.pet}">
        <div class="alert alert-danger">
            <g:eachError bean="${this.pet}" var="error">
                <p>${error.field}: ${error.message}</p>
            </g:eachError>
        </div>
    </g:hasErrors>

    <g:form controller="pet" action="update">
        <g:hiddenField name="id" value="${this.pet?.id}"/>
        <div class="form-group">
            <label for="name">Name</label>
            <g:textField name="name" value="${this.pet?.name}" required="" class="form-control" pattern="[A-Za-z ]+" inputmode="text" title="Only letters and spaces are allowed."/>
        </div>

        <div class="form-group">
            <label for="dateOfBirth">Date of Birth</label>
            <g:datePicker name="dateOfBirth" value="${this.pet?.dateOfBirth}" required="" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="type">Type</label>
            <g:select name="type" from="['Dog', 'Cat', 'Bird', 'Rabbit', 'Fish', 'Other']"
                      value="${this.pet?.type}" required="" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="owner">Owner</label>
            <g:select name="owner.id" from="${this.owners}" optionKey="id"
                      optionValue="${(owner) -> "${owner.firstName} ${owner.lastName}"}"
                      value="${this.pet?.owner?.id}" required="" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary">Update Pet</button>
        <g:link controller="pet" action="index" class="btn btn-secondary">Cancel</g:link>
    </g:form>
</div>
</body>
</html>