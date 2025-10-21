<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Ajouter un Fournisseur</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 30px;
        }

        form {
            background-color: #fff;
            width: 50%;
            margin: 40px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 15px;
            color: #444;
        }

        input[type="text"],
        input[type="email"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 6px;
            margin-top: 20px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>Ajouter un Fournisseur</h2>

<form method="post">
    Nom : <input type="text" name="nom" required><br>
    Adresse : <input type="text" name="adresse" required><br>
    Téléphone : <input type="text" name="telephone" required><br>
    Email : <input type="email" name="email" required><br>
    Pays : <input type="text" name="pays" required><br>
    <input type="submit" value="Ajouter">
</form>

<%
if(request.getParameter("nom") != null) {
    String nom = request.getParameter("nom");
    String adresse = request.getParameter("adresse");
    String telephone = request.getParameter("telephone");
    String email = request.getParameter("email");
    String pays = request.getParameter("pays");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://mysql_container:3306/tp2?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
            "ahlem",
            "ahlem123"
        );

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO Fournisseur (nom, adresse, telephone, email, pays) VALUES (?, ?, ?, ?, ?)"
        );
        ps.setString(1, nom);
        ps.setString(2, adresse);
        ps.setString(3, telephone);
        ps.setString(4, email);
        ps.setString(5, pays);
        ps.executeUpdate();
        con.close();
        out.println("<p style='color:green;'>Fournisseur ajouté avec succès !</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
    }
}
%>

<a href="index.jsp">Retour à la liste</a>
</body>
</html>
