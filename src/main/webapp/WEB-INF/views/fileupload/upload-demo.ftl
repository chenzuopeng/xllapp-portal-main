<!DOCTYPE html>
<html>
<head>
<title></title>
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="js/jBox/Skins/Default/jbox.css"/>"/>
<link rel="stylesheet" type="text/css" href="<@full_path path="js/jBox/Skins/Default/jbox.css"/>"/>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jBox/jquery.jBox-2.3.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jBox/i18n/jquery.jBox-zh-CN.js"/>"></script>

<script type="text/javascript" src="<@full_path path="js/uploadfile.js"/>"></script>
<script type="text/javascript" src="<@full_path path="upload/file/js/variables"/>"></script>

<script type="text/javascript" src="<@full_path path="js/demo/ajaxfileupload.js"/>"></script>

<style type="text/css">
.upbtn {
display: inline-block;  
    zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */  
    *display: inline;  
    vertical-align: baseline;  
    margin: 0 2px;  
    outline: none;  
    cursor: pointer;  
    text-align: center;  
    text-decoration: none;  
    font: 14px/100% Arial, Helvetica, sans-serif;  
    padding: .5em 2em .55em;  
    text-shadow: 0 1px 1px rgba(0,0,0,.3);  
    -webkit-border-radius: .5em;   
    -moz-border-radius: .5em;  
    border-radius: .5em;  
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
    box-shadow: 0 1px 2px rgba(0,0,0,.2); 
}
</style>

</head>

<body>

<fieldset>
<legend>上传图片</legend>
<input id="test1" name="test1" type="text" fileUploadType="image">
</fieldset>
<p/>
<fieldset>
<legend>上传文件</legend>
<input id="test2" name="test2" type="text" fileUploadType="file">
</fieldset>
<p/>
<fieldset>
<legend>自定义上传策略(需要在服务端配置对应的策略)</legend>
<input id="test3" name="test3" type="text" fileUploadType="file" fileUploadStrategy="abc">
</fieldset>
<p/>

<fieldset>
<legend>为"上传"按钮添加class:</legend>
<input id="test4" name="test4" type="text" fileUploadType="file" fileUploadButtonClass="upbtn">
</fieldset>
<p/>
<fieldset>
<legend>使用第三方页面文件上传组件(ajaxFileUpload)</legend>
<input id="fileToUpload" type="file" size="45" name="file"><input type="button" style="margin-left: 5px;" onclick="ajaxFileUpload()" value="上传">
<p/>
服务端响应信息:
<br>
<textarea id="file-upload-result" cols="80" rows="5"></textarea>
<script type="text/javascript">

    function ajaxFileUpload()
    {

        $.ajaxFileUpload
        (
                {
                    url:'<@full_path path="upload/file/json/file"/>',
                    secureuri:false,
                    fileElementId:'fileToUpload',
                    dataType: 'json',
                    success: function (data, status)
                    {
                       $("#file-upload-result").append(JSON.stringify(data));               
                    },
                    error: function (data, status, e)
                    {
                        alert("error:"+e);
                        alert("error:"+status);
                        alert("error:"+JSON.stringify(data));
                    }
                }
        )

        return false;

    }
</script>
</fieldset>
</body>
</html>