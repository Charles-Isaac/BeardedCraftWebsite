<%-- 
    Document   : delBD
    Created on : 2017-10-02, 14:17:20
    Author     : Administrateur
--%>

<%@page import="java.io.Console"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Map"%>
<%@ page import="org.json.JSONObject"%>
<%

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    int totalErase = 0; 
    Map<String, String[]> m = request.getParameterMap();
    String[] proj = m.getOrDefault("projectname", new String[]{""});
    String[] lang = m.getOrDefault("language", new String[]{"Francais"});

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tp1_charles-isaac", "root", "");
    con.setAutoCommit(false);
    PreparedStatement st = con.prepareStatement("DELETE FROM project WHERE projectname = ? and language = ?;");
    
    st.setString(1, proj[0]);
    st.setString(2, lang[0]);

    totalErase+=st.executeUpdate();

    con = DriverManager.getConnection("jdbc:mysql://localhost/tp1web", "root", "");
    st = con.prepareStatement("DELETE FROM headerimage WHERE projectname = ?");
    st.setString(1, proj[0]);

    totalErase+=st.executeUpdate();

    con = DriverManager.getConnection("jdbc:mysql://localhost/tp1web", "root", "");
    st = con.prepareStatement("DELETE FROM subheaderimage where projectname = ?");
    st.setString(1, proj[0]);

    totalErase+=st.executeUpdate();
    
    if (totalErase == 0) {
        response.sendError(404, "Can't delete nonexistant project");
        con.rollback();
        return;
    }
    con.setAutoCommit(true);
    response.sendError(200, "All good!");
    /*var formData = {
                projectName: $('#projectName').val(),
                progLanguage: $('#progLanguage').val(),
                language: $('#Language').val(),
                title: $('#title').text(),                
                shortTitle: $('#shortTitle').text(),
                description: $('#Description').text(),
                header1: $('#header1').text(),
                header2: $('#header2').text(),
                para1: $('#para1').text(),
                para2: $('#para2').text(),
                titleImgData: partsImgTitle[1].substr(7),
                titleImgType: partsImgTitle[0].substr(11),
                headerImg1Data: partsImgHeader1[1].substr(7),
                headerImg1Type: partsImgHeader1[0].substr(11),
                headerImg2Data: partsImgHeader2[1].substr(7),
                headerImg2Type: partsImgHeader2[0].substr(11),
            };*/
%>

