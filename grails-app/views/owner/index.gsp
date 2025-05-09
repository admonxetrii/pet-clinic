<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="container mt-5">
            <section class="row">
                <a href="#list-pet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>

            <h1><g:message code="default.list.label" args="[entityName]" /></h1>

            <g:if test="${flash.message}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Contact Number</th>
                            <th>Address</th>
                            <th>Pets</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${owners}" var="owner">
                        <tr>
                            <td>${owner.firstName} ${owner.lastName}</td>
                            <td>${owner.contactNumber}</td>
                            <td>${owner.address}</td>
                            <td>${owner.pets?.size() ?: 0}</td>
                            <td>
                                <g:link controller="owner" action="show" id="${owner.id}" class="btn btn-sm btn-info">
                                    <i class="fas fa-eye"></i>
                                </g:link>
                                <g:link controller="owner" action="edit" id="${owner.id}" class="btn btn-sm btn-warning">
                                    <i class="fas fa-edit"></i>
                                </g:link>
                                <g:link controller="owner" action="delete" id="${owner.id}"
                                        class="btn btn-sm btn-danger"
                                        onclick="return confirm('Are you sure you want to delete this owner?')">
                                    <i class="fas fa-trash"></i>
                                </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>