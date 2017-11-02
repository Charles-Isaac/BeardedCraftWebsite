<%-- 
    Document   : AffichageBD
    Created on : 2017-09-07, 16:37:44
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page language="java" import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tp1_charles-isaac", "root"/*user*/, ""/*password*/);
    ResultSet rs = con.prepareStatement("SELECT * from Lab3Part2;").executeQuery();
    if (rs.next()) {
        out.print("<div id=\"a\">");
        out.print("<table style=\"width:100%\" border=\"1\">");
        out.print("<tr>");
        out.print("<th>Idx</th>");
        out.print("<th>Txt</th>");
        out.print("</tr>");
        out.print("<tr>");
        out.print("<th>" + rs.getInt("Idx") + "</th>");
        out.print("<th>" + rs.getString("Txt") + "</th>");
        out.print("</tr>");
        
        out.print("</table>");
        out.print("</div>");

        out.print("<br>");

        out.print("<div id=\"b\">");
        out.print("<table style=\"width:100%\" border=\"1\">");
        out.print("<tr>");
        out.print("<th>Idx</th>");
        out.print("<th>Txt</th>");
        out.print("</tr>");
        while (rs.next()) {
            out.print("<tr>");
            out.print("<th>" + rs.getInt("Idx") + "</th>");
            out.print("<th>" + rs.getString("Txt") + "</th>");
            out.print("</tr>");
        }
        out.print("</table>");
        out.print("</div>");
    } else {
        out.print("<div id=\"a\">");
        out.print("<table style=\"width:100%\" border=\"1\">");
        out.print("<tr>");
        out.print("<th>Idx</th>");
        out.print("<th>Txt</th>");
        out.print("</tr>");

        out.print("</div>");

        out.print("<br>");

        out.print("<div id=\"b\">");
        out.print("<table style=\"width:100%\" border=\"1\">");
        out.print("<tr>");
        out.print("<th>Idx</th>");
        out.print("<th>Txt</th>");
        out.print("</tr>");

        out.print("</table>");
        out.print("</div>");

    }


%>
