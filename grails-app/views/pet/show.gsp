<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Pet Details</title>
</head>
<body>
<div class="container mt-5">
    <h2>Pet Details</h2>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">${pet.name}</h5>
            <p class="card-text">
                <strong>Type:</strong> ${pet.type}<br>
                <strong>Age:</strong> ${pet.age}<br>
                <strong>Owner:</strong> ${pet.owner.toString()}
            </p>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header">
            <h5 class="mb-0">Visits</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Visit Date</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pet.visits}" var="visit">
                        <tr>
                            <td>${visit.visitDate}</td>
                            <td>${visit.description}</td>
                            <td>
                                <g:link controller="visit" action="show" id="${visit.id}" class="btn btn-sm btn-info">
                                    <i class="fas fa-eye"></i>
                                </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <g:link controller="visit" action="create" params="[petId: pet.id]" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add Visit
        </g:link>
        <g:link controller="pet" action="edit" id="${pet.id}" class="btn btn-primary">
            <i class="fas fa-edit"></i> Edit
        </g:link>
        <g:link controller="pet" action="index" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back
        </g:link>
    </div>
</div>
</body>
</html>