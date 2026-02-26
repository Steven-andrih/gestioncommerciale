<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login MiniERP</title>
</head>
<body>

<h2>Connexion</h2>

<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
    Email: <input type="text" name="email" required><br><br>
    Mot de passe: <input type="password" name="password" required><br><br>
    <button type="submit">Se connecter</button>
</form>

<% if(request.getParameter("error") != null) { %>
    <p style="color:red;">Email ou mot de passe incorrect</p>
<% } %>

</body>
</html>