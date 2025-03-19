<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Group Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<!-- Admin Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Group_Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/groups">Manage Groups</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/users">Manage Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/reports">Reports</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-danger" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br>
<div class="container mt-4">
   <center> <h2>Group Management</h2></center><br><br>

   <!-- Right-aligned button -->
    <div class="d-flex justify-content-end">
        <a href="/groups/add" class="btn btn-primary mb-3">Add New Group</a>
    </div>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <table class="table table-bordered" style="box-shadow:2px 2px 2px 2px grey">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Group Name</th>
                <th>Created On</th>
                <th>Update On</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="group" items="${groups}">
                <tr>
                    <td>${group.groupId}</td>
                    <td>${group.groupName}</td>
                     <td>${group.createdAt}</td>
                      <td>${group.updatedAt}</td>
                    <td>
                        <a href="/groups/edit/${group.groupId}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/groups/delete/${group.groupId}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this group?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS (for navbar toggling) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
