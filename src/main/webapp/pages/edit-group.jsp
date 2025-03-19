<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Edit Group</title>
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




<div class="container mt-4">
    <h2>Edit Group</h2>

    <!-- Display validation error message -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form action="/groups/update" method="post">
        <input type="hidden" id="groupId" name="groupId" value="${group.groupId}">
        
        <div class="mb-3">
            <label for="groupName" class="form-label">Group Name</label>
            <input type="text" id="groupName" name="groupName" class="form-control" value="${group.groupName}" required>
        </div>
        
        <button type="submit" class="btn btn-success">Update</button>
        <a href="/groups/dash" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
