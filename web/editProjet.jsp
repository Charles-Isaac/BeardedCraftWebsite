<%-- 
    Document   : editBD
    Created on : 2017-10-02, 14:17:20
    Author     : Administrateur
--%>

<%@page import="java.io.Console"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="application/text" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Map"%>
<%@ page import="org.json.JSONObject"%>
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tp1_charles-isaac", "root"/*user*/, ""/*password*/);
    String imageTitre = "alt=\"title Img\"";
    String imageHeader1 = "alt=\"Header1 Img\"";
    String imageHeader2 = "alt=\"Header2 Img\"";

    Map<String, String[]> m = request.getParameterMap();
    String[] proj = m.getOrDefault("projectname", new String[]{""});
    String[] lang = m.getOrDefault("language", new String[]{"francais"});

    PreparedStatement ps = con.prepareStatement("SELECT title, description, projecttext,progLanguage, ProjectTextSecondary, shortTitle, image, imageType, encoding, header1, header2 from project join headerimage on (project.projectname = headerimage.projectname) where project.projectname = ? and language = ?;");
    ps.setString(1, proj[0]);
    ps.setString(2, lang[0]);

    ResultSet rs = ps.executeQuery();
    String titre = "Title";
    String projectName = proj[0];
    String progLanguage = "";
    String shortTitle = "ShortTitle";
    String heading1 = "header1";
    String heading2 = "header2";
    String projectText = "Lorem ipsum.";
    String projectTextSecondary = "Lorem ipsum.";
    String language = lang[0];
    String description = "";
    if (rs.next()) {
        titre = rs.getString("title");
        projectText = rs.getString("projecttext");
        projectTextSecondary = rs.getString("ProjectTextSecondary");
        imageTitre = rs.getString("imageType")
                + ";" + rs.getString("encoding")
                + ", " + rs.getString("image");

        heading1 = rs.getString("header1");
        heading2 = rs.getString("header2");
        shortTitle = rs.getString("shortTitle");
        description = rs.getString("description");
        progLanguage = rs.getString("progLanguage");
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



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>

    $(document).ready(function ()
    {
        $("#btnSubmit").click(function ()
        {
            var partsImgTitle = $('#titleImg').attr("src").split(';');
            var partsImgHeader1 = $('#headerImg1').attr("src").split(';');
            var partsImgHeader2 = $('#headerImg2').attr("src").split(';');
            if (partsImgTitle.length !== 2) {
                alert("veuilliez changer l'image titre pour une image valide");
                return;
            }
            if (partsImgHeader1.length !== 2) {
                alert("veuilliez changer l'image d'entête no1 pour une image valide");
                return;
            }
            if (partsImgHeader2.length !== 2) {
                alert("veuilliez changer l'image d'entête no2 pour une image valide");
                return;
            }

            var formData = {
                projectName: $('#projectName').val(),
                progLanguage: $('#progLanguage').val(),
                language: $('#Language').val(),
                title: $('#title').text(),
                shortTitle: $('#shortTitle').val(),
                description: $('#Description').val(),
                header1: $('#header1').text(),
                header2: $('#header2').text(),
                para1: $('#para1').text(),
                para2: $('#para2').text(),
                titleImgData: partsImgTitle[1].substr(7),
                titleImgType: partsImgTitle[0].substr(11),
                headerImg1Data: partsImgHeader1[1].substr(7),
                headerImg1Type: partsImgHeader1[0].substr(11),
                headerImg2Data: partsImgHeader2[1].substr(7),
                headerImg2Type: partsImgHeader2[0].substr(11)
            };
            //$.post('addBD.jsp', JSON.stringify(formData)); 
            var message = "";
            var NotEmpty = false;
            for (var key in formData) {
                if (formData[key] === "") {
                    message += "veuillez renseigner le champ: " + key + "\n";
                }
                NotEmpty = true;
            }
            if (message !== "") {
                alert(message);
                return;
            }

            $.post('editBD.jsp', {JsonObj: JSON.stringify(formData)}, "application/json; charset=utf-8")
                    .done(function (msg) {
                        alert('the request was successfully sent to the server');
                        window.location.replace("base.jsp?page=" + $('#projectName').val());
                    })
                    .fail(function (xhr, textStatus, errorThrown) {
                        alert(textStatus + "\n" + errorThrown);
                    });
            /*
             $.ajax({
             url: 'addBD.jsp',
             type: 'POST',
             data: {JsonObj: JSON.stringify(formData)},
             contentType: "application/json; charset=utf-8",
             success: function (result) {
             alert('the request was successfully sent to the server');
             },
             error: function (er) {
             if (er.status === 200)
             {
             alert('the request was successfully sent to the server');
             window.location.replace("base.jsp?page=" + $('#projectName').val());
             
             } else
             {
             alert("error! " + er.status);
             }
             }
             });*/
        }
        );
    });</script>



<script>
    $(switchBackground);
    var oFReader = new FileReader(),
            rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;
    oFReader.onload = function (oFREvent) {
        localStorage.setItem('b', oFREvent.target.result);
        switchBackground();
    };
    var id;
    function switchBackground() {
        $(id).attr('src', localStorage.getItem('b'));
    }
    function dragImage(event, idImg) {
        event.preventDefault();
        id = idImg;
        if (event.dataTransfer.files.length <= 0 || !rFilter.test(event.dataTransfer.files[0].type)) {
            alert("You must select a valid image file!");
            return;
        }
        oFReader.readAsDataURL(event.dataTransfer.files[0])
    }
    function loadImageFile(elemt, idImg) {
        id = idImg;
        if (!elemt.files.length) {
            return;
        }
        var oFile = elemt.files[0];
        if (!rFilter.test(oFile.type)) {
            alert("You must select a valid image file!");
            return;
        }
        oFReader.readAsDataURL(oFile);
    }
</script>
<form>
    <div class="column-group gutters">
        <div class="all-100 column-group">
            <h2  contenteditable="true" id="title"><%= titre%></h2>&nbsp;&nbsp;
        </div>
        <div class="all-100">
            <input id="imgChanger" class="fixedWidthImage" type="file" onchange="loadImageFile(this, '#titleImg')" />
            <img class="fixedWidthImage" id="titleImg" src="data:image/<%= imageTitre%>" contenteditable="true" ondrop="dragImage(event, '#titleImg')">
        </div>
    </div>
    <div class="column-group gutters">
        <div class="all-50 small-100 tiny-100">
            <h3 contenteditable="true" id="header1"><%= heading1%></h3>
            <input id="imgChanger" class="fixedWidthImage" type="file" onchange="loadImageFile(this, '#headerImg1')" />
            <img id="headerImg1" class="fixedWidthImage" src="data:image/<%= imageHeader2%>" contenteditable="true" alt="1200x600" ondrop="dragImage(event, '#headerImg1')">
            <p class="quarter-top-space" contenteditable="true" id="para1"><%= projectText%></p>
        </div>
        <div class="all-50 small-100 tiny-100">
            <h3 contenteditable="true" id="header2"><%= heading2%></h3>
            <input id="imgChanger" class="fixedWidthImage" type="file" onchange="loadImageFile(this, '#headerImg2')" />
            <img class="fixedWidthImage" id="headerImg2" src="data:image/<%= imageHeader2%>" contenteditable="true" ondrop="dragImage(event, '#headerImg2')">
            <p class="quarter-top-space" contenteditable="true" id="para2"><%= projectTextSecondary%></p>
        </div>
    </div>

    <div class="column-group push-center" style=" border: 1px #d0c7b7 solid; background: #efefef;">

        <div class="all-half push-center">
            <div>
                <h3>Meta:</h3>
                projectName:<br>
                <input type="text" name="projectName" id="projectName" value="<%= projectName%>">
                <br>
                progLanguage:<br>
                <input type="text" name="progLanguage" id="progLanguage" value="<%= progLanguage%>">
                <br>
                shortTitle:<br>
                <input type="text" name="shortTitle" id="shortTitle" value="<%= shortTitle%>">
                <br>
                Description:<br>
                <textarea  type="text" name="Description" id="Description" cols="40" rows="5"><%= description%></textarea>
                <br>
                Language:<br>
                <input type="text" name="Language" id="Language" value="<%= language%>">
                <br>
                <br>
                <input type="button" name="submit" value="EDITER" id="btnSubmit">
            </div>
        </div>
    </div>

</form>