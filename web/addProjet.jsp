<%-- 
    Document   : editProjet
    Created on : 2017-10-02, 12:23:42
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



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

            //alert(":D");
            //return;

            /* $.ajax({
             // Your server script to process the upload
             url: 'addBD.jsp',
             type: 'POST',
             
             // Form data
             data: new FormData(formData),
             
             // Tell jQuery not to process data or worry about content-type
             // You *must* include these options!
             cache: false,
             contentType: false,
             processData: false,
             
             // Custom XMLHttpRequest
             xhr: function () {
             var myXhr = $.ajaxSettings.xhr();
             if (myXhr.upload) {
             // For handling the progress of the upload
             myXhr.upload.addEventListener('progress', function (e) {
             if (e.lengthComputable) {
             $('progress').attr({
             value: e.loaded,
             max: e.total,
             });
             }
             }, false);
             }
             return myXhr;
             }
             });
             */
            $.post('addBD.jsp', {JsonObj: JSON.stringify(formData)}, "application/json; charset=utf-8")
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
            <h2  contenteditable="true" id="title">Title</h2>&nbsp;&nbsp;
        </div>
        <div class="all-100">
            <input id="imgChanger" class="fixedWidthImage" type="file" onchange="loadImageFile(this, '#titleImg')" />
            <img class="all-100"id="titleImg" src="img/Example.png" contenteditable="true" ondrop="dragImage(event, '#titleImg')">
        </div>
    </div>
    <div class="column-group gutters">
        <div class="all-50 small-100 tiny-100">
            <h3 contenteditable="true" id="header1">header1</h3>
            <input id="imgChanger" class="fixedWidthImage" type="file" onchange="loadImageFile(this, '#headerImg1')" />
            <img id="headerImg1" class="fixedWidthImage" src="img/Example.png" contenteditable="true" alt="1200x600" ondrop="dragImage(event, '#headerImg1')">
            <p class="quarter-top-space" contenteditable="true" id="para1">Lorem ipsum. Text project.</p>
        </div>
        <div class="all-50 small-100 tiny-100">
            <h3 contenteditable="true" id="header2">header2</h3>
            <input id="imgChanger" type="file" onchange="loadImageFile(this, '#headerImg2')" />
            <img id="headerImg2" class="fixedWidthImage" src="img/Example.png" contenteditable="true" alt="1200x600" ondrop="dragImage(event, '#headerImg2')">
            <p class="quarter-top-space" contenteditable="true" id="para2">Lorem ipsum. Second text project.</p>
        </div>
    </div>

    <div class="column-group push-center" style=" border: 1px #d0c7b7 solid; background: #efefef;">

        <div class="all-half push-center">
            <div>
                <h3>Meta:</h3>
                projectName:<br>
                <input type="text" name="projectName" id="projectName" value="">
                <br>
                progLanguage:<br>
                <input type="text" name="progLanguage" id="progLanguage" value="">
                <br>
                shortTitle:<br>
                <input type="text" name="shortTitle" id="shortTitle" value="">
                <br>
                Description:<br>
                <textarea  type="text" name="Description" id="Description" cols="40" rows="5"></textarea>
                <br>
                Language:<br>
                <input type="text" name="Language" id="Language" value="Francais">
                <br>
                <br>
                <input type="button" name="submit" value="AJOUTER" id="btnSubmit">
            </div>
        </div>
    </div>

</form>