<%-- 
    Document   : index
    Created on : 2017-09-14, 13:51:24
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Map"%>

<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tp1_charles-isaac", "root"/*user*/, ""/*password*/);
    String imageTitre = "alt=\"title Img\"";
    String imageHeader1 = "alt=\"Header1 Img\"";
    String imageHeader2 = "alt=\"Header2 Img\"";

    Map<String, String[]> m = request.getParameterMap();
    String[] proj = m.get("page");
    String[] lang = m.getOrDefault("language", new String[]{"francais"});

    PreparedStatement ps = con.prepareStatement("SELECT title, description, projecttext, ProjectTextSecondary, image, imageType, encoding, header1, header2 from project join headerimage on (project.projectname = headerimage.projectname) where project.projectname = ? and language = ?;");
    ps.setString(1, proj[0]);
    ps.setString(2, lang[0]);

    ResultSet rs = ps.executeQuery();
    String titre = "Title";
    String heading1 = "header1";
    String heading2 = "header2";
    String projectText = "Lorem ipsum.";
    String projectTextSecondary = "Lorem ipsum.";
    if (rs.next()) {
        titre = rs.getString("title");
        projectText = rs.getString("projecttext");
        projectTextSecondary = rs.getString("ProjectTextSecondary");
        imageTitre = rs.getString("imageType")
                + ";" + rs.getString("encoding")
                + ", " + rs.getString("image");
        
        heading1 = rs.getString("header1");
        heading2 = rs.getString("header2");
    }

    ps = con.prepareCall("SELECT image, imagetype,encoding from subheaderimage where projectname = ? order by subheadernumber");
    ps.setString(1, proj[0]);
    rs = ps.executeQuery();

    if (rs.next()) {
            imageHeader1 = rs.getString("imageType")
                + ";" + rs.getString("encoding")
                + ", " + rs.getString("image");
            if (rs.next()) {
                    imageHeader2 = rs.getString("imageType")
                + ";" + rs.getString("encoding")
                + ", " + rs.getString("image");
                }
        }



%>

<div class="column-group gutters">
    <div class="all-100">
        <h2><%= titre%></h2>
        <img class="fixedWidthImage" src="data:image/<%= imageTitre%>">
    </div>
</div>
<div class="column-group gutters">
    <div class="all-50 small-100 tiny-100">
        <h3><%= heading1%></h3>
        <img class="fixedWidthImage" src="data:image/<%= imageHeader1%>" alt="">
        <p class="quarter-top-space"><%= projectText%></p>
    </div>
    <div class="all-50 small-100 tiny-100">
        <h3><%= heading2%></h3>
        <img class="fixedWidthImage" src="data:image/<%= imageHeader2%>" alt="">
        <p class="quarter-top-space"><%= projectTextSecondary%></p>
    </div>
</div>


