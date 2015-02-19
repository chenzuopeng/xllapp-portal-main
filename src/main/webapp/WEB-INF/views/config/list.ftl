<!DOCTYPE html>
<html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="css/icity.css"/>"/>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.messages_zh.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/My97DatePicker/WdatePicker.js"/>" ></script>
<script type="text/javascript" src="<@full_path path="js/icity.js"/>"></script>
<script type="text/javascript">
<!--
$().ready(function() {
		 renderTable();
});
//-->
</script>
</head>

<body>

<!-- 查询表单 -->
<form id="searchForm" action="?act=QUERY" method="post">
	<fieldset class="search_panel">
		<legend>查询条件</legend>
            <table class="search_field">
				 <tr>
					  <td><span>组</span></td>
					  <td>
		   <input class="search_field_input" id="configGroup" name="configGroup" type="text"  value="${RequestParameters['configGroup']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>键</span></td>
					  <td>
		   <input class="search_field_input" id="configKey" name="configKey" type="text"  value="${RequestParameters['configKey']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>值</span></td>
					  <td>
		   <input class="search_field_input" id="configValue" name="configValue" type="text"  value="${RequestParameters['configValue']!}"/>
				      </td>
		         </tr>
			</table>
			<table class="search_button_panel">
				 <tr>
					  <td><input class="search_button" type="submit" value="查询"><input class="search_button" type="button" value="清空" onclick="cleanForm('#searchForm')"></td>
				 </tr>
			</table>
	</fieldset>
</form>

<!-- 按钮栏 -->
<table class="button_panel">
	<tr>
		<td><input class="action_button"  type="button" value="添加" onclick="showUrlByButton('?act=SHOW_FORM')"></td>
	</tr>
</table>

<!-- 表格 -->
<table class="data_panel">
	<thead>
		<tr>
			<th><span></span></th>
			<th><span>组</span></th>
			<th><span>键</span></th>
			<th><span>值</span></th>
			<th><span>创建时间</span></th>
		     <th style="width: 100px;"><span>操作</span></th>
		</tr>
	</thead>
	<tbody>
	    <#list page.result as item>
		<tr>
			     <td><#if item.id?has_content>${item.id}</#if></td>
			     <td><#if item.configGroup?has_content>${item.configGroup}</#if></td>
			     <td><#if item.configKey?has_content>${item.configKey}</#if></td>
			     <td><#if item.configValue?has_content>${item.configValue}</#if></td>
			     <td><#if item.createTime?has_content>${item.createTime?datetime}</#if></td>
			     <td><a href="?act=SHOW_FORM&id=${item.id!}">更新</a> | <a href="?act=DELETE&ids=${item.id!}">删除</a></td>
		</tr>
		</#list>
	</tbody>
</table>

<!-- 分页栏 -->
<table class="pager_panel">
	<tr>
		<td><@page_navigator/></td>
	</tr>
</table>
</body>
</html>