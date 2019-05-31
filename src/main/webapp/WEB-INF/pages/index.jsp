<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Computer parts warehouse</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/style.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
</nav>

<div class="main">
    <!-- Actual search box -->
    <form action="${pageContext.request.contextPath}/results" method="get">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search warehouse" name="name">
            <div class="input-group-append">
                <button class="btn btn-secondary" type="submit">
                    <i class="fa fa-search">Find</i>
                </button>
            </div>
        </div>
    </form>
</div>


<div class="container">
    <h2>Computer parts</h2>
    <p>A simple computer parts warehouse application</p>

    <div class="pagination">
        <c:forEach begin="1" end="${pagesCount}" step="1" varStatus="i">
            <c:url value="/" var="url">
                <c:param name="page" value="${i.index}"/>
            </c:url>
            <a href="${url}">${i.index}</a>
        </c:forEach>
    </div>

    <table class="table table-hover">
        <thead>
        <th>Part title</th>
        <th>Required in computer</th>
        <th>Quantity available</th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <c:forEach var="part" items="${partsList}">
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
        <tfoot>
        <tr>
            <td>Number of computers</td>
            <td>${requestScope.availability}</td>
            <td>can be build</td>
        </tr>
        </tfoot>
        <form action="${pageContext.request.contextPath}/filtered" method="get">
            <div class="filters">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="submit" id="inlineCheckbox1" value="required" name="option">
                    <label class="form-check-label" for="inlineCheckbox1"></label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="submit" id="inlineCheckbox2" value="non-required"
                           name="option">
                    <label class="form-check-label" for="inlineCheckbox2"></label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="submit" id="inlineCheckbox3" value="all" name="option">
                    <label class="form-check-label" for="inlineCheckbox3"></label>
                </div>
            </div>
        </form>
    </table>
    <p>You surely can always supply our warehouse by adding parts!</p>
    <c:url value="/" var="var"/>
    <form action="${var}" method="post">
        <div class="row">
            <div class="col">
                <input type="text" class="form-control" name="title" id="title" placeholder="Computer part title"
                       required>
            </div>
            <div class="col">
                <input type="text" class="form-control" name="required" id="required"
                       placeholder="Is this part required? true/false" required>
            </div>
            <div class="col">
                <input type="text" class="form-control" name="quantity" id="quantity"
                       placeholder="Give a number of items to add" required pattern="[0-9]+">
            </div>
        </div>
        <div class="addbutton">
            <button type="submit" class="btn btn-primary">Submit adding</button>
        </div>
    </form>
</div>
<div class="footer">
    <p>2019</p>
</div>

</body>
</html>

