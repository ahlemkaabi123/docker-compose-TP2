<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Liste des Fournisseurs</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        a {
            color: #007bff;
            text-decoration: none;
            margin: 0 10px;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        table {
            border-collapse: collapse;
            margin-top: 20px;
            width: 70%;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 16px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e6f0ff;
        }
    </style>
</head>
<body>
<h2>Liste des Fournisseurs</h2>

<a href="addFournisseur.jsp">Ajouter un Fournisseur</a> ||
<a href="deleteFournisseur.jsp">supprimer un Fournisseur</a>
<br><br>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://mysql_container:3306/tp2?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
        "ahlem",
        "ahlem123"
    );

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM Fournisseur");

%>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Adresse</th>
        <th>Telephone</th>
        <th>Email</th>
        <th>Pays</th>
    </tr>
<%
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("nom") %></td>
        <td><%= rs.getString("adresse") %></td>
        <td><%= rs.getString("telephone") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("pays") %></td>
    </tr>
<%
    }
    con.close();
} catch(Exception e) {
    out.println("Erreur : " + e.getMessage());
}
%>
</table>
</body>
</html>
