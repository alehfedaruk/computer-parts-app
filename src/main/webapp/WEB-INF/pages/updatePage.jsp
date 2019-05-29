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
    <title>Update</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
</nav>

<c:if test="${empty computerPart.title}">
    <c:url value="/add" var="var"/>
</c:if>

<c:if test="${!empty computerPart.title}">
    <c:url value="/update" var="var"/>
</c:if>

<form action="${var}" method="post">
    <input type="hidden" name="id" value="${computerPart.id}">

    <div class="row">
        <div class="col">
            <input type="text" class="form-control" name="title" id="title_update" placeholder="${computerPart.title} - previous value" required minlength="3">
        </div>
        <div class="col">
            <input type="text" class="form-control" name="required" id="required2_update" placeholder="Is this part required? true/false" required pattern="true|false">
        </div>
        <div class="col">
            <input type="text" class="form-control" name="quantity" id="quantity2_update" placeholder="${computerPart.quantity} - previous value" required pattern="[0-9]+">
        </div>
    </div>
    <div class="addbutton">
        <button type="submit" class="btn btn-primary">Update</button>
    </div>
</form>
</body>
</html>