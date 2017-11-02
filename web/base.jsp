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

    //String imageTitre = "";
    String projectsMenu = "";
    String carouselImage = "";
    Map<String, String[]> m = request.getParameterMap();
    String[] proj = m.getOrDefault("page", new String[]{""});
    String[] lang = m.getOrDefault("language", new String[]{"francais"});

    PreparedStatement ps = con.prepareStatement("SELECT distinct project.projectname, shortTitle, ProgLanguage, Description, imageType, encoding, image from project join headerimage on (project.projectname = headerimage.projectname) where language = ? order by ProgLanguage;");
    ps.setString(1, lang[0]);

    ResultSet rs = ps.executeQuery();
    //String titre = "Title";
    //String heading1 = "header1";
    //String heading2 = "header2";
    //String projectText = "Lorem ipsum.";

    String currentLanguage = "";
    while (rs.next()) {
        String progLang = rs.getString("ProgLanguage");
        if (!currentLanguage.equals(progLang)) {
            if (currentLanguage != "") {
                projectsMenu += "</ul></li>";
            }
            projectsMenu += "<li><a class=\"dropdownright\">" + progLang + "</a><ul class=\"dropdown-menu-aim submenu flyout right\">";
            currentLanguage = progLang;
        }
        projectsMenu += "<li><a class=\"linked \" href=\"?page=" + rs.getString("project.projectname") + "\" ONCLICK=\"\">"
                + rs.getString("shortTitle") + "</a></li>";
        carouselImage
                += "<li class=\"slide xlarge-100 large-100 medium-100 small-100 tiny-100\"> <a class=\"linked\"href=\"?page=" + rs.getString("projectname") + "\"><img class=\"half-bottom-space fixedWidthImage\" src=\"data:image/"
                + rs.getString("imageType") + ";"
                + rs.getString("encoding") + ", "
                + rs.getString("image")
                + "\"></a>";
        carouselImage += "<h4 class=\"no-margin\">" + rs.getString("shortTitle") + "</h4>";
        carouselImage += "<h5 class=\"slab\">" + progLang + "</h5>";
        carouselImage += "<p>" + rs.getString("Description") + "</p>";
        carouselImage += "</li>";
    }
    projectsMenu += "</ul></li>";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>B.C.C.</title>
        <meta name="description" content="">
        <meta name="author" content="ink, cookbook, recipes">
        <meta name="HandheldFriendly" content="True">
        <meta name="MobileOptimized" content="320">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

        <!-- Place favicon.ico and apple-touch-icon(s) here  -->
        <!--
                <link rel="shortcut icon" href="img/favicon.ico">
        
                <link rel="apple-touch-icon" href="img/touch-icon-iphone.png">
                <link rel="apple-touch-icon" sizes="76x76" href="img/touch-icon-ipad.png">
                <link rel="apple-touch-icon" sizes="120x120" href="img/touch-icon-iphone-retina.png">
                <link rel="apple-touch-icon" sizes="152x152" href="img/touch-icon-ipad-retina.png">
                <link rel="apple-touch-startup-image" href="img/splash.320x460.png" media="screen and (min-device-width: 200px) and (max-device-width: 320px) and (orientation:portrait)">
                <link rel="apple-touch-startup-image" href="img/splash.768x1004.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
                <link rel="apple-touch-startup-image" href="img/splash.1024x748.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        -->
        <!-- load Ink's CSS -->
        <link rel="stylesheet" type="text/css" href="css/ink-flex.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

        <!-- load Ink's CSS for IE8 -->
        <!--[if lt IE 9 ]>
            <link rel="stylesheet" href="css/ink-ie.min.css" type="text/css" media="screen" title="no title" charset="utf-8">
        <![endif]-->

        <!-- test browser flexbox support and load legacy grid if unsupported -->
        <script type="text/javascript" src="js/modernizr.js"></script>
        <script type="text/javascript">
            Modernizr.load({
                test: Modernizr.flexbox,
                nope: 'css/ink-legacy.min.css'
            });
        </script>

        <!-- load Ink's javascript files -->
        <script type="text/javascript" src="js/holder.js"></script>
        <script type="text/javascript" src="js/ink-all.min.js"></script>
        <script type="text/javascript" src="js/autoload.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script type="text/javascript" src="js/jquery.menu-aim.js"></script>



        <style type="text/css">

            body {
                background: #ededed;
            }

            header h1 small:before  {
                content: "|";
                margin: 0 0.5em;
                font-size: 1.6em;
            }

            footer {
                background: #ccc;
            }

            .panel {
                border-radius: 2px;
                -webkit-box-shadow: #dddddd 0 1px 1px 0;
                -moz-box-shadow: #dddddd 0 1px 1px 0;
                box-shadow: #dddddd 0 1px 1px 0;
                padding: 1em;
                border: 1px solid #BBB;
                background-color: #FFF;
            }
            .navbar .popover {
                width: 400px;
                -webkit-border-top-left-radius: 0px;
                -webkit-border-bottom-left-radius: 0px;
                border-top-left-radius: 0px;
                border-bottom-left-radius: 0px;
                overflow: hidden;
            }

            .navbar .popover-content {
                text-align: center;
            }

            .navbar .popover-content img {
                height: 212px;
                max-width: 250px;
            }

            .navbar .dropdown-menu-aim {
                -webkit-border-top-right-radius: 0px;
                -webkit-border-bottom-right-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-right-radius: 0px;

                -webkit-box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
                -moz-box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
            }

            .navbar .dropdown-menu-aim > li > a:hover {
            }

            .navbar .dropdown-menu-aim > li > .maintainHover {
                display: block !important;
            }

            .navbar .dropdown-menu-aim > li > ul {
                display: none !important;
            }

            #search {
                width: 130px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                background-color: white;
                background-image: url('searchicon.png');
                background-position: 10px 10px; 
                background-repeat: no-repeat;
                margin: 2px;
                padding: 8px 6px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
                overflow:hidden;
                float: right;
                text-align: right;
            }

            #search:focus {
                width: 100%;
            }

            .fixedWidthImage {
                width: 1400px;
                max-height: 675px;
            }
            .dropdownright::after{
                content: "\f0da";
                width: auto;
                margin-left: .8em;
                font-family: FontAwesome;
                color: #b3b3b3;
            }

        </style>

        <script language="JavaScript">
//https://stackoverflow.com/questions/15780717/get-parameter-values-from-href-in-jquery
            var pageName = "";
            $(document).ready(function () {
                $(window).resize(function (handler) {
                    if ($(window).width() <= 640) {
                        $("ul.dropdown-menu-aim.submenu.flyout.right").removeClass("submenu").removeClass("flyout").addClass("potato");
                       // $("ul.dropdown-menu-aim.submenu").removeClass("submenu").addClass("potatoes");

                    } else {
                        $("ul.dropdown-menu-aim.potato").addClass("submenu").addClass("flyout").removeClass("potato");                        
                        $("ul.dropdown-menu-aim.potatoes").addClass("submenu").removeClass("potatoes");


                    }

                });
                var page = getURLParameter(window.location.href, 'page');
                if (page !== null) {
                    pageName = page;
                    $.ajax({url: "projet.jsp", data: {'page': page}, success: function (result) {
                            $("#updateZone").html(result);
                            Holder.run(document.getElementById("updateZone"));
                            $('#deleteBtn').show();
                            $('#editBtn').show();
                        }});
                }

                $('#search').keypress(function (e) {
                    if (e.keyCode == 13)
                    {
                        var dataSrch = $(this).val();
                        $.ajax({url: "projetList.jsp", data: {'search': dataSrch}, success: function (result) {
                                $("#updateZone").html(result);
                                Holder.run(document.getElementById("updateZone"));
                            }});
                    }
                });
                $("#deleteBtn a").click(function (e) {
                    e.preventDefault();
                    $.ajax({url: $(this).attr('href'), data: {projectname: pageName},
                        success:
                                function ()
                                {
                                    alert("All done!");
                                    window.location.replace("index.jsp")
                                }}).fail(
                            function (XMLHttpRequest, textStatus, errorThrown)
                            {
                                alert(textStatus + "\n" + errorThrown + "aaa");
                            }
                    );
                });
                $("#editBtn a").click(function (e) {
                    e.preventDefault();
                    $.ajax({url: $(this).attr('href'), data: {projectname: pageName},
                        success: function (result) {
                            $("#updateZone").html(result);
                            Holder.run(document.getElementById("updateZone"));
                            $('#deleteBtn').hide();
                            $('#editBtn').hide();
                        }}).fail(
                            function (XMLHttpRequest, textStatus, errorThrown)
                            {
                                alert(textStatus + "\n" + errorThrown + "aaa");
                            }
                    );
                });
                $("a").click(function (e) {
                    if (!$(this).closest('ul').hasClass('pagination chevron') && !!$(this).attr('href')) {
                        if ($(this).hasClass('navigationBtn')) {
                            return;
                        }
                        e.preventDefault();
                        bgsound.play();
                        var urldata = ($(this).attr('href'));
                        var page = getURLParameter(urldata, 'page');
                        if (page === null) {
                            if ($(this).hasClass('externalLink')) {
                                window.location.replace(urldata);
                                $('#deleteBtn').hide();
                                $('#editBtn').hide();
                            } else
                            {
                                $.ajax({url: urldata, success: function (result) {
                                        $("#updateZone").html(result);
                                        Holder.run(document.getElementById("updateZone"));
                                        $('#deleteBtn').hide();
                                        $('#editBtn').hide();
                                    }});
                            }
                        } else {
                            pageName = page;
                            $.ajax({url: "projet.jsp", data: {'page': page}, success: function (result) {
                                    $("#updateZone").html(result);
                                    Holder.run(document.getElementById("updateZone"));
                                    $('#deleteBtn').show();
                                    $('#editBtn').show();
                                }});
                        }
                    }
                });
            }
            );
            function getURLParameter(url, name) {
                return (RegExp(name + '=' + '(.+?)(&|$)').exec(url) || [, null])[1];
            }


        </script>


    </head>
    <body>
        <audio autoplay id="bgsound">
            <source src="http://dokimos.org/ajff/cat.wav"
                    type="audio/wav">
        </audio>



        <div class="ink-grid">

            <!--[if lt IE 9 ]>
            <div class="ink-alert basic" role="alert">
                <button class="ink-dismiss">&times;</button>
                <p>
                    <strong>You are using an outdated Internet Explorer version.</strong>
                    Please <a href="http://browsehappy.com/" class="navigationBtn">upgrade to a modern browser</a> to improve your web experience.
                </p>
            </div>
            <![endif]-->

            <!-- Add your site or application content here -->

            <header class="vertical-space">
                <h1>Charles-Isaac Côté<small>programmeur</small></h1>
                <nav class="ink-navigation navbar">
                    <ul class="ink-dropdown menu tiny-vertical small-vertical horizontal black ink-grid column-group">

                        <li class="active"><a href="base.jsp" class="navigationBtn">Home</a></li>
                        <li>
                            <a href="projetList.jsp" class="linked dropdown-toggle dropdownright" data-toggle="dropdown">Projets</a>
                            <ul class="dropdown-menu-aim submenu" role="menu">
                                <%= projectsMenu%>
                            </ul>
                        </li>
                        <li class="all-auto"></li>
                        <li style=""><a href="addProjet.jsp" class="linked">Add</a></li>
                        <li style="display: none;" id="editBtn"><a href="editProjet.jsp" class="navigationBtn" id="editBtn" class="linked">Edit</a></li>
                        <li style="display: none;" id="deleteBtn"><a href="deleteProjet.jsp" class="navigationBtn" id="deleteBtn" class="linked">Delete</a></li>

                        <li style="display: none;"><a href="#">CV</a></li>

                        <li>
                            <input id='search' type="text" name="search" placeholder="Search...">
                        </li>



                        <script>

                            var $menu = $(".dropdown-menu-aim");
                            var $menuDown = $(".dropdown-menu-aim-down");
                            // jQuery-menu-aim: <meaningful part of the example>
                            // Hook up events to be fired on menu row activation.
                            $menu.menuAim({
                                submenuDirection: "right",
                                activate: activateSubmenu,
                                deactivate: deactivateSubmenu,
                                tolerance: 20,
                                //exitMenu: mouseleaveMenu
                            });
                            $menuDown.menuAim({
                                submenuDirection: "below",
                                activate: activateSubmenu,
                                deactivate: deactivateSubmenu,
                                //exitMenu: deactivateSubmenu

                            });
                            // jQuery-menu-aim: </meaningful part of the example>

                            // jQuery-menu-aim: the following JS is used to show and hide the submenu
                            // contents. Again, this can be done in any number of ways. jQuery-menu-aim
                            // doesn't care how you do this, it just fires the activate and deactivate
                            // events at the right times so you know when to show and hide your submenus.
                            function activateSubmenu(row) {
                                var $row = $(row),
                                        submenuId = $row.data("submenuId"),
                                        $submenu = $("#" + submenuId),
                                        height = $menu.outerHeight(),
                                        width = $menu.outerWidth();
                                // Show the submenu
                                $submenu.css({
                                    display: "block",
                                    top: -1,
                                    left: width - 3, // main should overlay submenu
                                    height: height - 4  // padding for main dropdown's arrow
                                });
                                // Keep the currently activated row's highlighted look
                                $row.find("a").addClass("maintainHover");
                                $row.find("ul").addClass("maintainHover");
                            }

                            function deactivateSubmenu(row) {
                                var $row = $(row),
                                        submenuId = $row.data("submenuId"),
                                        $submenu = $("#" + submenuId);
                                // Hide the submenu and remove the row's highlighted look
                                $submenu.css("display", "none");
                                $row.find("a").removeClass("maintainHover");
                                $row.find("ul").removeClass("maintainHover");
                            }

                            // Bootstrap's dropdown menus immediately close on document click.
                            // Don't let this event close the menu if a submenu is being clicked.
                            // This event propagation control doesn't belong in the menu-aim plugin
                            // itself because the plugin is agnostic to bootstrap.
                            $(".dropdown-menu li").click(function (e) {
                                e.stopPropagation();
                            });
                            $(".linked").click(function () {
                                // Simply hide the submenu on any click. Again, this is just a hacked
                                // together menu/submenu structure to show the use of jQuery-menu-aim.

                                if (!!$(this).attr('href'))
                                {
                                    $("a.maintainHover").removeClass("maintainHover");
                                    $("ul.maintainHover").removeClass("maintainHover");
                                }
                                /* $(".popover").css("display", "none");
                                 $("a.maintainHover").removeClass("maintainHover");
                                 $("ul.maintainHover").removeClass("maintainHover");*/
                            });
                        </script>
                    </ul>
                </nav>
            </header>
            <section>               
                <div id="updateZone" class="panel vertical-space">
                    <h2> Bienvenue sur la page principale du TP1 de Prog Web! </h2>
                    <br>
                    C'est un site web!!!1
                </div>
            </section>
            <div class="panel vertical-space">

                <div id="car1" class="ink-carousel">

                    <ul class="stage column-group half-gutters unstyled">
                        <%= carouselImage%>
                    </ul>


                    <nav id="p3" class="ink-navigation" data-previous-label="" data-next-label="">
                        <ul class="pagination chevron" onclick = "carClicked()">
                        </ul>
                    </nav>
                </div>

                <script>
                    var instCarousel;
                    function carClicked()
                    {
                        instCarousel.stopAutoAdvance();
                    }
                    Ink.requireModules(['Ink.UI.Carousel_1'], function (InkCarousel) {
                        instCarousel = new InkCarousel('#car1', {pagination: '#p3', nextLabel: '', previousLabel: '', autoAdvance: 3000});
                    });
                </script>
            </div>
        </div>
        <script>
            $(document).ready(function ()
            {
                function loop()
                {
                    $('.note').animate({'opacity': 0}, 1000, function () {
                        $(this).text('Charles-Isaac Côté');
                    }).animate({'opacity': 1}, 1000);
                    $('.note').animate({'opacity': 0}, 1000, function () {
                        $(this).text('Programmeur');
                    }).animate({'opacity': 1}, 1000, loop);
                }
                loop();
            });
        </script>
        <footer class="clearfix">
            <div class="ink-grid">
                <ul class="unstyled inline half-vertical-space">
                    <li class="active"><a class='externalLink' href="https://github.com/Charles-Isaac">Github</a></li>
                    <li><a class='externalLink' target="_blank" href="mailto:clonecharle5@gmail.com">Contacter</a></li>
                </ul>
                <p class="note">Charles-Isaac Côté</p>
            </div>
        </footer>
    </body>
</html>


