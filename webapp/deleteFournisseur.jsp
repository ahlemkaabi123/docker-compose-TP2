<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Supprimer un Fournisseur</title>
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

        table {
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
<h2>Supprimer un Fournisseur</h2>

<%
String message = "";
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://mysql_container:3306/tp2?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
        "ahlem",
        "ahlem123"
    );

    if(request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        PreparedStatement ps = con.prepareStatement("DELETE FROM Fournisseur WHERE id = ?");
        ps.setInt(1, id);
        int rows = ps.executeUpdate();
        if(rows > 0) {
            message = "Fournisseur supprimé avec succès !";
        } else {
            message = "Aucun fournisseur trouvé avec cet ID.";
        }
    }

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT id, nom, pays, email FROM Fournisseur");
%>

<p><%= message %></p>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Pays</th>
        <th>Email</th>
        <th>Action</th>
    </tr>
<%
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("nom") %></td>
        <td><%= rs.getString("pays") %></td>
        <td><%= rs.getString("email") %></td>
        <td>
            <form method="post">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <input type="submit" value="Supprimer">
            </form>
        </td>
    </tr>
<%
    }
    con.close();
} catch(Exception e) {
    out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
}
%>
</table>

<a href="index.jsp">Retour à la liste</a>
</body>
</html>
