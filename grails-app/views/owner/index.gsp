<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:link class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="create"><i
            class="fas fa-plus fa-sm text-white-50"></i> <g:message code="default.new.label"
                                                                    args="[entityName]"/></g:link>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">List of Enrolled Owners</h6>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-responsive-lg table-bordered" id="dataTable">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Contact Number</th>
                    <th>Address</th>
                    <th>Pets</th>
                    <th>Actions</th>
                </tr>
                </thead>
%{--                <tfoot>--}%
%{--                <tr>--}%
%{--                    <th>Name</th>--}%
%{--                    <th>Contact Number</th>--}%
%{--                    <th>Address</th>--}%
%{--                    <th>Pets</th>--}%
%{--                    <th>Actions</th>--}%
%{--                </tr>--}%
%{--                </tfoot>--}%
                <tbody>
                <g:each in="${owners}" var="owner">
                    <tr>
                        <td>
                            <g:link controller="owner" action="show" id="${owner.id}" class="text-primary font-weight-bold">
                                ${owner.firstName} ${owner.lastName}
                            </g:link>
                        </td>
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
                            <a href="#" class="btn btn-sm btn-danger openDeleteOwnerModel" data-id="${owner.id}" data-owner-name="${owner.toString()}" data-toggle="modal" data-target="#deleteOwnerModal"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Logout Modal-->
<div class="modal fade" id="deleteOwnerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Are you Sure?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Delete" below if you are ready to delete owner: <br/> "<span class="font-weight-bold" id="ownerNameGoesHere"></span>".</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger ownerIdGoesHere" href="">
                    Delete
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).on("click", ".openDeleteOwnerModel", function () {
        const ownerId = $(this).data('id');
        const ownerName = $(this).data('owner-name')
        const uri = '${createLink(uri:'/owner/delete/')}' + ownerId
        $("#ownerNameGoesHere").html( ownerName );
        $(".ownerIdGoesHere").attr('href', uri)
    });
</script>

</body>
</html>