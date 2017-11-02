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

    Map<String, String[]> m = request.getParameterMap();
    String[] lang = m.getOrDefault("language", new String[]{"francais"});
    String[] search = m.getOrDefault("search", new String[]{""});

    PreparedStatement ps = con.prepareStatement("SELECT title, ProgLanguage, project.projectname, description, projecttext, image, imageType, encoding from project join headerimage on (project.projectname = headerimage.projectname) where language = ? and title like ? order by ProgLanguage;");
    ps.setString(1, lang[0]);    
    ps.setString(2, "%"+search[0]+"%");


    ResultSet rs = ps.executeQuery();
    String menuListProj = "";
    String currentLanguage = "";
    menuListProj="<ul class=\"\">";
    while (rs.next()) {
        String progLang = rs.getString("ProgLanguage");
        if (!currentLanguage.equals(progLang)) {
            if (currentLanguage != "") {
                menuListProj += "</ul></div></li>";
            }
            menuListProj += "<li class=\"\"><div class=\"bottom-space\"><h2>" + progLang + "</h2><ul class=\"\">";
            currentLanguage = progLang;
        }
        menuListProj += "<li class=\"\"><div class=\"all-100 small-100 tiny-100\">";
        menuListProj += "<a class=\"linked\"href=\"?page=" + rs.getString("projectname") + "\">";
        menuListProj += "<h3>" + rs.getString("title") + "</h3>";
        menuListProj += "<img class=\"half-bottom-space fixedWidthImage\" src=\"data:image/" 
                + rs.getString("imageType") + ";"
                + rs.getString("encoding") + ", "
                + rs.getString("image")
                + "\"></a></div></li>";
    }
    menuListProj += "</ul></div></li></ul>";
    /*<div class="all-100 small-100 tiny-100">
        <h3><%= heading1></h3>
        <img src="holder.js/1200x600/auto/ink" alt="">
        <p class="quarter-top-space"><%= projectText></p>
    </div>*/
%>

<div class="column-group">
    <div class="all-100">
        <h1>Projets:</h1>
    </div>
</div>
<div class="column-group gutters">
    <div class="all-100">
        <%= menuListProj%>
    </div>
</div>


