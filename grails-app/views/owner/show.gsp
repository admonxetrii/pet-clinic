<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Owner Details</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Owner Details</h2>
        
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${owner.firstName} ${owner.lastName}</h5>
                <p class="card-text">
                    <strong>Contact Number:</strong> ${owner.contactNumber}<br>
                    <strong>Address:</strong> ${owner.address}
                </p>
            </div>
        </div>

        <div class="card mt-4">
            <div class="card-header">
                <h5 class="mb-0">Pets</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Age</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${owner.pets}" var="pet">
                                <tr>
                                    <td>${pet.name}</td>
                                    <td>${pet.type}</td>
                                    <td>${pet.age} years</td>
                                    <td>
                                        <g:link controller="pet" action="show" id="${pet.id}" class="btn btn-sm btn-info">
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
            <g:link controller="owner" action="edit" id="${owner.id}" class="btn btn-primary">
                <i class="fas fa-edit"></i> Edit
            </g:link>
            <g:link controller="owner" action="index" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back
            </g:link>
        </div>
    </div>
</body>
</html>
