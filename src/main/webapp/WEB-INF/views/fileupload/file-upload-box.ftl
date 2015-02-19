<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="<@full_path path="js/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jBox/jquery.jBox-2.3.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jBox/i18n/jquery.jBox-zh-CN.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<@full_path path="js/jBox/Skins/Default/jbox.css"/>"/>

<script type="text/javascript" src="<@full_path path="js/uploadfile.js"/>"></script>
<script type="text/javascript" src="<@full_path path="upload/file/js/variables"/>"></script>

<style type="text/css">
        body{ font-size:14px;overflow: hidden;}
        input{ vertical-align:middle; margin:0; padding:0}
        .file-upload-div{ position:relative;width:320;}
        .input-text{ height:22px; border:1px solid #cdcdcd; width:180px;}
        .input-button{ background-color:#FFF; border:1px solid #cdcdcd;height:24px; width:60px;}
        .input-file{ position:absolute; top:0; right:60px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px;}
</style>

<script type="text/javascript">

     function fileUploadCallback(result,desc,absPath,relaPath,writeBackElementId){
            window.parent.fileUploadCallback(result,desc,absPath,relaPath,writeBackElementId);
     }
     
     function showProgressBar(){
            var div = $("<div/>");
            div.attr("id","progress-bar-div");
            div.css("width","100%");
            div.css("height","100%");
            div.css("backgroundColor","white");
            div.css("position","absolute");
            div.css("left",0);
            div.css("top",0);
            div.css("zIndex",9999);
            var table = $("<table/>");
            table.css("width","100%");
            table.css("height","100%");
            div.append(table);
            var tr = $("<tr/>");
            table.append(tr);
            var td = $("<td/>");
            td.attr("align","center");
            tr.append(td);
            var img=$("<img/>");
            img.attr("src",baseServerUrl+"img/uploading.gif");
            td.append(img);
            $("body").append(div);
     }
     
     $(document).ready(function(){
     
           $("#file-upload-button").click(function(){
                   showProgressBar();
                   $("#file-upload-form").submit();
           });
           
           $("#file").change(function(){
                 var value=$("#file").attr("value");
                 $("#file-info-input").attr("value",value);
                 if( value != ''){
                     $("#file-upload-button").removeAttr("disabled");
                 }
           });
           
           $("#file-upload-table").css("height",document.documentElement.clientHeight);
                
      });
     
</script>
</head>
<body>
		<table id="file-upload-table" style="width:100%;">
			<tr>
				<td align="center">
				    <div class="file-upload-div">
				       <form id="file-upload-form" target="file-upload-iframe" action="<@full_path path="/upload/file/js/"/>${RequestParameters["fileUploadStrategyId"] }/${RequestParameters["writeBackElementId"]}" method="post" enctype="multipart/form-data">
				          <input id="file-info-input"  type="text"  class="input-text" />
                          <input type="button" class="input-button" value="浏览" />
                          <input  id="file" name="file" type="file" class="input-file" size="28" />
				          <input id="file-upload-button" type="button" class="input-button"  disabled="disabled" value="上传" />
				       </form>
				    </div>
				</td>
			</tr>
		</table>
	    <iframe name="file-upload-iframe" style="display: none;width: 0px;height: 0px;"/>
<body>
</html>


