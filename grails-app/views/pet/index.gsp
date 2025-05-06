<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Pets</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Pets</h2>
        
        <div class="mb-3">
            <g:link controller="pet" action="create" class="btn btn-primary">
                <i class="fas fa-plus"></i> New Pet
            </g:link>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Age</th>
                        <th>Owner</th>
                        <th>Visits</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${pets}" var="pet">
                        <tr>
                            <td>${pet.name}</td>
                            <td>${pet.type}</td>
                            <td>${pet.age} years</td>
                            <td>${pet.owner.firstName} ${pet.owner.lastName}</td>
                            <td>${pet.visits?.size() ?: 0}</td>
                            <td>
                                <g:link controller="pet" action="show" id="${pet.id}" class="btn btn-sm btn-info">
                                    <i class="fas fa-eye"></i>
                                </g:link>
                                <g:link controller="pet" action="edit" id="${pet.id}" class="btn btn-sm btn-warning">
                                    <i class="fas fa-edit"></i>
                                </g:link>
                                <g:link controller="pet" action="delete" id="${pet.id}" 
                                    class="btn btn-sm btn-danger" 
                                    onclick="return confirm('Are you sure you want to delete this pet?')">
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
