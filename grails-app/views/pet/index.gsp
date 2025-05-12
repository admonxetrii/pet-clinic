<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Pets</title>
</head>
<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Pets</h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="create"><i
            class="fas fa-plus fa-sm text-white-50"></i> New Pet</g:link>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">List of Enrolled Pets</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-responsive-lg table-bordered" id="dataTable">
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
                        <td>
                            <g:link controller="pet" action="show" id="${pet.id}" class="text-primary font-weight-bold">
                                ${pet.name}
                            </g:link>
                        </td>
                        <td>${pet.type}</td>
                        <td>${pet.age}</td>
                        <td>${pet.owner.firstName} ${pet.owner.lastName}</td>
                        <td>${pet.visits?.size() ?: 0}</td>
                        <td>
                            <g:link controller="pet" action="show" id="${pet.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-eye"></i>
                            </g:link>
                            <g:link controller="pet" action="edit" id="${pet.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </g:link>
                            <a href="#" class="btn btn-sm btn-danger openDeletePetModal" data-id="${pet.id}" data-pet-name="${pet.name}" data-toggle="modal" data-target="#deletePetModal"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Delete Modal-->
<div class="modal fade" id="deletePetModal" tabindex="-1" role="dialog" aria-labelledby="deletePetModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletePetModalLabel">Are you Sure?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">Select "Delete" below if you are ready to delete pet: <br/> "<span class="font-weight-bold" id="petNameGoesHere"></span>".</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger petIdGoesHere" href="">
                    Delete
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).on("click", ".openDeletePetModal", function () {
        const petId = $(this).data('id');
        const petName = $(this).data('pet-name');
        const uri = '${createLink(uri:'/pet/delete/')}' + petId;
        $("#petNameGoesHere").html(petName);
        $(".petIdGoesHere").attr('href', uri);
    });
</script>
</body>
</html>