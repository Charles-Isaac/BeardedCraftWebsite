<%-- 
    Document   : editBD
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

    JSONObject jobj = new JSONObject(request.getParameter("JsonObj"));
    if (jobj != null && jobj.length() > 0) {

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tp1_charles-isaac", "root", "");
        con.setAutoCommit(false);
        try {
            PreparedStatement st = con.prepareStatement("SELECT project.projectname from project where language = ? and projectName like ?;");
            st.setString(1, jobj.getString("language"));
            st.setString(2, jobj.getString("projectName"));

            ResultSet rs = st.executeQuery();
            if (!rs.next()) {
                response.sendError(404, "Le projet du nom " + jobj.getString("projectName") + " n'existe pas!!! ... Wait what?!");
                con.rollback();

                return;
            }

            st = con.prepareStatement("UPDATE project SET Language=?,ProgLanguage=?,Title=?,shortTitle=?,Description=?,ProjectText=?,ProjectTextSecondary=?,header1=?,header2=? WHERE projectName = ? ;");
            st.setString(1, jobj.getString("language"));
            st.setString(2, jobj.getString("progLanguage"));
            st.setString(3, jobj.getString("title"));
            st.setString(4, jobj.getString("shortTitle"));
            st.setString(5, jobj.getString("description"));
            st.setString(6, jobj.getString("para1"));
            st.setString(7, jobj.getString("para2"));
            st.setString(8, jobj.getString("header1"));
            st.setString(9, jobj.getString("header2"));
            st.setString(10, jobj.getString("projectName"));
            st.executeUpdate();

            st = con.prepareStatement("UPDATE headerimage SET image=?,imageType=?,encoding=? WHERE projectName = ?;");
            st.setString(1, jobj.getString("titleImgData"));
            st.setString(2, jobj.getString("titleImgType"));
            st.setString(3, "base64");
            st.setString(4, jobj.getString("projectName"));
            st.executeUpdate();

            st = con.prepareStatement("UPDATE subheaderimage SET image=?,imageType=?,encoding=? WHERE projectName=? and subHeaderNumber=?;");
            st.setString(1, jobj.getString("headerImg1Data"));
            st.setString(2, jobj.getString("headerImg1Type"));
            st.setString(3, "base64");
            st.setString(4, jobj.getString("projectName"));
            st.setInt(5, 1);
            st.executeUpdate();

            st = con.prepareStatement("UPDATE subheaderimage SET image=?,imageType=?,encoding=? WHERE projectName=? and subHeaderNumber=?;");
            st.setString(1, jobj.getString("headerImg2Data"));
            st.setString(2, jobj.getString("headerImg2Type"));
            st.setString(3, "base64");
            st.setString(4, jobj.getString("projectName"));
            st.setInt(5, 2);
            st.executeUpdate();

            st.executeUpdate();
        } catch (Exception e) {
            con.rollback();
            response.sendError(500, e.getMessage());
            return;
        }
        con.setAutoCommit(true);

        response.sendError(200);

    }


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

