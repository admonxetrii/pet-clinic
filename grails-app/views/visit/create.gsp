<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Create Visit</title>
</head>
<body>
<div class="container mt-5">
    <h2>Create Visit</h2>

    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${visit}">
        <div class="alert alert-danger">
            <g:eachError bean="${visit}" var="error">
                <p>${error.field}: ${error.message}</p>
            </g:eachError>
        </div>
    </g:hasErrors>

    <g:form controller="visit" action="save">
        <div class="form-group">
            <label for="pet">Pet</label>
            <g:select name="pet.id" from="${pets}" optionKey="id"
                      optionValue="${(pet) -> "${pet.name} (${pet.type})"}"
                      value="${visit?.pet?.id}" required="" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="visitDate">Visit Date</label>
            <g:datePicker name="visitDate" value="${visit?.visitDate}" required="" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <g:textArea name="description" value="${visit?.description}" required="" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary">Create Visit</button>
        <g:link controller="visit" action="index" class="btn btn-secondary">Cancel</g:link>
    </g:form>
</div>
</body>
</html>