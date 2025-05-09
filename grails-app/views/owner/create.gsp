<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <a href="#edit-owner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="nav" role="navigation">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </section>

        <h2>Create Owner</h2>

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

        <g:form controller="owner" action="save">
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
                <g:textField name="contactNumber" value="${owner?.contactNumber}" required="" class="form-control" pattern="~/\\[0-9]{10}" inputmode="numeric" maxlength="10" minLength="10" title="Enter a 10 digit phone number (numbers only)"/>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <g:textArea name="address" value="${owner?.address}" required="" class="form-control"/>
            </div>

            <button type="submit" class="btn btn-primary">Create Owner</button>
            <g:link controller="owner" action="index" class="btn btn-secondary">Cancel</g:link>
        </g:form>
    </div>
</div>
</body>
</html>
