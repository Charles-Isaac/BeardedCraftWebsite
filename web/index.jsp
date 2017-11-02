<%-- 
    Document   : index
    Created on : 2017-09-14, 13:51:24
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta http-equiv="refresh" content="0; url=base.jsp" />
<!--
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JSP Page</title>
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

        <!-- load Ink's CSS -->
 <!--       <link rel="stylesheet" type="text/css" href="css/ink-flex.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

        <!-- load Ink's CSS for IE8 -->
        <!--[if lt IE 9 ]>
            <link rel="stylesheet" href="css/ink-ie.min.css" type="text/css" media="screen" title="no title" charset="utf-8">
        <![endif]-->

        <!-- test browser flexbox support and load legacy grid if unsupported -->
 <!--       <script type="text/javascript" src="js/modernizr.js"></script>
        <script type="text/javascript">
            Modernizr.load({
                test: Modernizr.flexbox,
                nope: 'css/ink-legacy.min.css'
            });
        </script>

        <!-- load Ink's javascript files -->
  <!--      <script type="text/javascript" src="js/holder.js"></script>
        <script type="text/javascript" src="js/ink-all.min.js"></script>
        <script type="text/javascript" src="js/autoload.js"></script>


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

        </style>

    </head>
    <body>



        <div class="ink-grid">

            <!--[if lt IE 9 ]>
            <div class="ink-alert basic" role="alert">
                <button class="ink-dismiss">&times;</button>
                <p>
                    <strong>You are using an outdated Internet Explorer version.</strong>
                    Please <a href="http://browsehappy.com/">upgrade to a modern browser</a> to improve your web experience.
                </p>
            </div>
            <![endif]-->

            <!-- Add your site or application content here -->

 <!--           <header class="vertical-space">
                <h1>Charles-Isaac Côté<small>programmeur</small></h1>
                <nav class="ink-navigation">
                    <ul class="menu horizontal black">
                        <li class="active"><a href="#">Home</a></li>
                        <li>
                            <a href="#">Pojets</a>
                            <ul class="submenu">
                                <li class="submenu">
                                    <a href="#">C#</a>
                                    <ul class="submenu flyout right">
                                        <li><a href="projet.jsp?proj=CPPA">Proj C# A</a></li>
                                        <li><a href="#">Proj C# B</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#">C++</a>
                                    <ul class="submenu flyout right">
                                        <li><a href="#">Proj C++ A</a></li>
                                        <li><a href="#">Proj C++ B</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#">Cuda</a>
                                    <ul class="submenu flyout right">
                                        <li><a href="#">Proj Cuda A</a></li>
                                        <li><a href="#">Proj Cuda B</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#">Python</a>
                                    <ul class="submenu flyout right">
                                        <li><a href="#">Proj C++ A</a></li>
                                        <li><a href="#">Proj C++ B</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#">CV</a></li>
                    </ul>
                </nav>
            </header>

            <div class="panel vertical-space" id='zoneUpdate'>

                <div id="car1" class="ink-carousel">

                    <ul class="stage column-group half-gutters unstyled">

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="img/TTT.png">
                            <h4 class="no-margin">Intercollégial de création de jeux vidéo de Valleyfield</h4>
                            <h5 class="slab">C#</h5>
                            <p>Jeu de tir à la troisième personne en C# utilisant MonoGame et OpenGL créé pour l'intercollégial de création de jeux vidéo en 40 heures</p>
                        </li>

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="img/TDS.png">
                            <h4 class="no-margin">Multiplayer Top-Down Shooter</h4>
                            <h5 class="slab">C#</h5>
                            <p>Jeu de tir multijoueur à la troisième personne en C# et utilisant le GDI+</p>
                        </li>

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="http://lorempixel.com/1400/675/nightlife/3">
                            <h4 class="no-margin">SpaceShooter</h4>
                            <h5 class="slab">Baby Doe</h5>
                            <p>Shoot 'em up codé en 5h</p>
                        </li>

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="http://lorempixel.com/1400/675/nightlife/4">
                            <h4 class="no-margin">Highlight Title</h4>
                            <h5 class="slab">Baby Doe</h5>
                            <p>É importante questionar o quanto a constante divulgação das informações ainda não demonstrou convincentemente que vai participar na mudança do impacto na agilidade decisória.</p>
                        </li>

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="http://lorempixel.com/1400/675/nightlife/5">
                            <h4 class="no-margin">Highlight Title</h4>
                            <h5 class="slab">Baby Doe</h5>
                            <p>É importante questionar o quanto a constante divulgação das informações ainda não demonstrou convincentemente que vai participar na mudança do impacto na agilidade decisória.</p>
                        </li>

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="http://lorempixel.com/1400/675/nightlife/6">
                            <h4 class="no-margin">Highlight Title</h4>
                            <h5 class="slab">Baby Doe</h5>
                            <p>É importante questionar o quanto a constante divulgação das informações ainda não demonstrou convincentemente que vai participar na mudança do impacto na agilidade decisória.</p>
                        </li>

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="http://lorempixel.com/1400/675/nightlife/7">
                            <h4 class="no-margin">Highlight Title</h4>
                            <h5 class="slab">Baby Doe</h5>
                            <p>É importante questionar o quanto a constante divulgação das informações ainda não demonstrou convincentemente que vai participar na mudança do impacto na agilidade decisória.</p>
                        </li>

                        <li class="slide xlarge-100 large-100 medium-100 small-100 tiny-100">
                            <img class="half-bottom-space" src="http://lorempixel.com/1400/675/nightlife/8">
                            <h4 class="no-margin">Highlight Title</h4>
                            <h5 class="slab">Baby Doe</h5>
                            <p>É importante questionar o quanto a constante divulgação das informações ainda não demonstrou convincentemente que vai participar na mudança do impacto na agilidade decisória.</p>
                        </li>
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
            <div class="column-group gutters">
                <div class="all-100">
                    <h2>Home</h2>
                    <img src="holder.js/1650x928/auto/ink" alt="">
                </div>
            </div>
            <div class="column-group gutters">
                <div class="all-50 small-100 tiny-100">
                    <h3>heading</h3>
                    <img src="holder.js/1200x600/auto/ink" alt="">
                    <p class="quarter-top-space">"Red is not the right word," was the reply. "The plague was scarlet.  The whole face and body turned scarlet in an hour's time. Don't I  know? Didn't I see enough of it? And I am telling you it was scarlet  because&mdash;well, because it was scarlet. There is no other word for it."</p>
                </div>
                <div class="all-50 small-100 tiny-100">
                    <h3>heading</h3>
                    <img src="holder.js/1200x600/auto/ink" alt="">
                    <p class="quarter-top-space">"Red is not the right word," was the reply. "The plague was scarlet.  The whole face and body turned scarlet in an hour's time. Don't I  know? Didn't I see enough of it? And I am telling you it was scarlet  because&mdash;well, because it was scarlet. There is no other word for it."</p>
                </div>
            </div>
        </div>
        <footer class="clearfix">
            <div class="ink-grid">
                <ul class="unstyled inline half-vertical-space">
                    <li class="active"><a href="#">About</a></li>
                    <li><a href="#">Sitemap</a></li>
                    <li><a href="#">Contacts</a></li>
                </ul>
                <p class="note">Identification of the owner of the copyright, either by name, abbreviation, or other designation by which it is generally known.</p>
            </div>
        </footer>
    </body>
</html>


