<!DOCTYPE html>
<html>
<head>
<title>表单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="js/jBox/Skins/Default/jbox.css"/>"/>
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="css/icity.css"/>"/>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.messages_zh.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/My97DatePicker/WdatePicker.js"/>" ></script>
<script type="text/javascript" src="<@full_path path="js/jBox/jquery.jBox-2.3.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jBox/i18n/jquery.jBox-zh-CN.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/icity.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/uploadfile.js"/>"></script>
<script type="text/javascript" src="<@full_path path="upload/js/variables"/>"></script>

<script type="text/javascript">
<!--
$().ready(function() {
     var validator = $("#saveForm").validate({
          rules: {
				configGroup: {
						required:true
				},
				configKey: {
						required:true
				},
				configValue: {
						required:true
				},
		 },
		 errorClass:"search_error",
		 errorElement:"div"});
	  $(".reset").click(function() {
           validator.resetForm();
      });
});
//-->
</script>
</head>

<body>
<form id="saveForm" method="post"  action="?act=SAVE">
<input type="hidden" id="id" name="id"  value="<#if entity?has_content>${entity.id}</#if>"/>
<table class="save_form_table" border="1">
	        <tr>
				<td class="save_form_field_label"><span>组</span></td>
				<td><input class="save_form_field_input" id="configGroup" name="configGroup"  type="text"  value="<#if entity?has_content>${entity.configGroup}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>键</span></td>
				<td><input class="save_form_field_input" id="configKey" name="configKey"  type="text"  value="<#if entity?has_content>${entity.configKey}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>值</span></td>
				<td><input class="save_form_field_input" id="configValue" name="configValue"  type="text"  value="<#if entity?has_content>${entity.configValue}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>备注</span></td>
				<td><textarea class="save_form_field_textarea" id="remark" name="remark" ><#if entity?has_content>${entity.remark}</#if></textarea></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>创建时间</span></td>
				<td><input class="save_form_field_input save_form_field_readonly" id="createTime" name="createTime" type="text" readonly="true" onfocus="this.blur();" value="<#if entity?has_content && entity.createTime?has_content>${entity.createTime?datetime}</#if>"/></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>最后修改时间</span></td>
				<td><input class="save_form_field_input save_form_field_readonly" id="lastModifTime" name="lastModifTime" type="text" readonly="true" onfocus="this.blur();" value="<#if entity?has_content && entity.lastModifTime?has_content>${entity.lastModifTime?datetime}</#if>"/></td>
		    </tr>
		<tr>
			<td colspan="2" class="save_form_button_panel"><input type="submit"  value="保存"/><input type="reset" class="reset" value="重置"/></td>
		</tr>
</table>
</form>
</body>
</html>