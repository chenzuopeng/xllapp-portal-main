
/**
*文件上传回调函数，用于接收文件上传后，服务端返回的结果.
*
*参数说明：
*	result: 结果，0 成功,1 失败
*	desc: 结果说明
*	absPath： 上传文件保存的绝对路径,用于页面预览
*	relaPath： 上传文件保存的相对路径
*	writeBackElementId：回写信息的页面元素的ID
*/
function fileUploadCallback(result,desc,absPath,relaPath,writeBackElementId){
   $.jBox.close(true);
   if(result==0){
        $("#"+writeBackElementId).attr("value",relaPath);
        renderPreviewImgElement(writeBackElementId,absPath);
        $.jBox.success('上传成功', '');
   }else{
        $.jBox.error(desc, '上传失败');
   }
}

/**
*展示上传文件对话框.
*
*参数说明：
*	   fileUploadStrategyId: 上传策略Id
*	   writeBackElementId:  回写信息的页面元素的ID
*/
function showFileUploadBox(fileUploadStrategyId,writeBackElementId){
            var url=baseServerUrl+"upload/file/box"+"?fileUploadStrategyId="+fileUploadStrategyId+"&writeBackElementId="+writeBackElementId;
            $.jBox("iframe:"+url, {
		    	 title: "文件上传",
		    	 width: 350,
		    	 height: 130,
		    	 buttons: { 'close': true },
                 iframeScrolling: "no"
	        });
}

/**
 * 重置文件上传表单元素
 *
 * 参数说明：
 *     elementId   文件上传表单元素的id
 */
function resetUploadFileElement(elementId){
    var element = $("#" + elementId);
    element.attr("value", element.attr("initValue"));
    var previewImgElement = $("#" + getPreviewImgElementId(elementId));
    previewImgElement.attr("src", previewImgElement.attr("initSrc"));
}

/**
 * 清空文件上传表单元素
 *
 * 参数说明：
 *     elementId   文件上传表单元素的id
 */
function clearUploadFileElement(elementId){
    $("#" + elementId).attr("value", "");
    $("#" + getPreviewImgElementId(elementId)).attr("src", getDefaultPreviewImgUrl())
}

function getDefaultPreviewImgUrl(){
    return baseServerUrl+"img/no_picture.gif";
}

function getPreviewImgElementId(elementId){
    return elementId + "-preview-img";
}

function renderPreviewImgElement(element,imgUrl){
    var previewImgElement = element;
    if(typeof(element)=="string"){
        var previewImgElement=$("#"+getPreviewImgElementId(element));
    }
    previewImgElement.attr("src",imgUrl);
    previewImgElement.css("border","2px solid #cdcdcd");
    previewImgElement.attr("width", 145);
    previewImgElement.attr("height", 136);
    previewImgElement.css("margin","3px");
}

function createButtonUploadFile(name,onclick,buttonClass){
    var button = $("<input/>");
    button.attr("type", "button");
    button.attr("value", name);
    button.attr("onclick", onclick);
    if(typeof (buttonClass) != "undefined"){
        button.addClass(buttonClass);
    }else{
        button.css("margin-left","3px");
    }
    return button;
}

/**
 * 去除字符串的前导空格、尾随空格和行终止符
 */
function trimUploadFile(str){
    str = str.replace(/^(\s|\u00A0)+/,'');
    for(var i=str.length-1; i>=0; i--){
        if(/\S/.test(str.charAt(i))){
            str = str.substring(0, i+1);
            break;
        }
    }
    return str;
}

/**
 *渲染文件上传表单元素(带有"fileUploadType"属性的页面表单元素).
 *
 * 支持的属性:
 *
 *   fileUploadType  上传文件类型，必须
 *   fileUploadStrategy  上传策略,可选
 *   fileUploadButtonClass 上传按钮的class值，可选
 *
 */
function renderUploadFileElement(){
    $("input[fileUploadType]").each(function(){

        var element = $(this);

        var elementValue = element.attr("value");
        if(typeof (elementValue) != "undefined"){
            element.attr("initValue",elementValue);
        }

        var elementId = element.attr("id");
        if(typeof (elementId) == "undefined"){
            elementId="file-upload-element-" + Math.floor(Math.random() * ( 100 + 1));
            element.attr("id",elementId);
        }

        var fileUploadStrategyId = element.attr("fileUploadStrategy");
        var fileUploadType=element.attr("fileUploadType");
        if(typeof (fileUploadStrategyId) == "undefined"){
            fileUploadStrategyId=fileUploadType;
        }

        var div = $("<div/>");
        div.attr("id", elementId + "-div");
        element.before(div);

        var fileUploadButtonClass = element.attr("fileUploadButtonClass");
        var uploadButton = createButtonUploadFile("上传","showFileUploadBox('" + fileUploadStrategyId + "','" + elementId + "')",fileUploadButtonClass);
        var clearButton = createButtonUploadFile("清空","clearUploadFileElement('" + elementId + "')",fileUploadButtonClass);
        var resetButton = createButtonUploadFile("重置","resetUploadFileElement('" + elementId + "')",fileUploadButtonClass);

        div.append(element, uploadButton,clearButton,resetButton);

        if(fileUploadType == "image") {
            var img = $("<img/>");
            img.attr("id", getPreviewImgElementId(elementId));

            if(typeof (elementValue) != "undefined" && trimUploadFile(elementValue).length > 0){
                $.get(baseServerUrl+"upload/file/fileurl",{"fileUploadStrategyId":fileUploadStrategyId,"relativePath":elementValue},function(fileUrl){
                    renderPreviewImgElement(img,fileUrl);
                    img.attr("initSrc",fileUrl);
                });
            }else{
                renderPreviewImgElement(img,getDefaultPreviewImgUrl());
                img.attr("initSrc",getDefaultPreviewImgUrl());
            }

            var br = $("<br/>");
            div.append(br,img);
        }
    });
}
        
$(document).ready(function(){
      renderUploadFileElement();
});
