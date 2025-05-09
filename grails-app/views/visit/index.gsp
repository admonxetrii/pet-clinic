<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Visits</title>
</head>
<body>
<div class="container mt-5">
    <h2>Visits</h2>

    <div class="mb-3">
        <g:link controller="visit" action="create" class="btn btn-primary">
            <i class="fas fa-plus"></i> New Visit
        </g:link>
    </div>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Pet</th>
                <th>Owner</th>
                <th>Visit Date</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${visits}" var="visit">
                <tr>
                    <td>${visit.pet.name}</td>
                    <td>${visit.pet.owner.toString()}</td>
                    <td>${visit.visitDate}</td>
                    <td>${visit.description}</td>
                    <td>
                        <g:link controller="visit" action="show" id="${visit.id}" class="btn btn-sm btn-info">
                            <i class="fas fa-eye"></i>
                        </g:link>
                        <g:link controller="visit" action="edit" id="${visit.id}" class="btn btn-sm btn-warning">
                            <i class="fas fa-edit"></i>
                        </g:link>
                        <g:link controller="visit" action="delete" id="${visit.id}"
                                class="btn btn-sm btn-danger"
                                onclick="return confirm('Are you sure you want to delete this visit?')">
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