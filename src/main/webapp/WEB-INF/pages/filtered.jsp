<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/style.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Filter</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
</nav>
<div class="container">
    <h2>Results to your request</h2>

    <table class="table table-hover">
        <thead>
        <th>Part title</th>
        <th>Required in computer</th>
        <th>Quantity available</th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <c:forEach var="part" items="${filtered}">
            <tr>
                <td>${part.title}</td>
                <td>${part.required}</td>
                <td>${part.quantity}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/update/${part.id}">update</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/delete/${part.id}"
                       onclick="return confirm('Are you sure?')">delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
