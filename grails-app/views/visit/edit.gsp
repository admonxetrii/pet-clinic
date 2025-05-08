<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Edit Visit</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Visit</h2>
        
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

        <g:form controller="visit" action="update">
            <g:hiddenField name="id" value="${visit?.id}"/>
            <div class="form-group">
                <label for="date">Date</label>
                <g:datePicker name="date" value="${visit?.date}" required="" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <g:textField name="description" value="${visit?.description}" required="" class="form-control" pattern="[A-Za-z0-9 .,!?-]+" inputmode="text" title="Only letters, numbers, spaces, and . , ! ? - are allowed."/>
            </div>
            <button type="submit" class="btn btn-primary">Update Visit</button>
            <g:link controller="visit" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</body>
</html>
