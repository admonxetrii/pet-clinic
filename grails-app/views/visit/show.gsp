<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Visit Details</title>
</head>
<body>
<div class="container mt-5">
    <h2>Visit Details</h2>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Visit for ${visit.pet.name}</h5>
            <p class="card-text">
                <strong>Date:</strong> ${visit.visitDate}<br>
                <strong>Description:</strong> ${visit.description}<br>
                <strong>Pet Type:</strong> ${visit.pet.type}<br>
                <strong>Owner:</strong> ${visit.pet.owner.toString()}
            </p>
        </div>
    </div>

    <div class="mt-4">
        <g:link controller="visit" action="edit" id="${visit.id}" class="btn btn-primary">
            <i class="fas fa-edit"></i> Edit
        </g:link>
        <g:link controller="visit" action="index" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back
        </g:link>
    </div>
</div>
</body>
</html>