<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Owners</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Owners</h2>
        
        <div class="mb-3">
            <g:link controller="owner" action="create" class="btn btn-primary">
                <i class="fas fa-plus"></i> New Owner
            </g:link>
        </div>

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
