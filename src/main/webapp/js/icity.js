
/**
 * 展示时间面板
 */
function showDatePicker(id){
     WdatePicker({el:id,dateFmt:'yyyy-M-d H:mm:ss'});
}

/**
 * 給表格行添加显示效果
 */
function renderTable(){
    $("table.data_panel tr:odd").addClass("data_record_tr_odd");
    $("table.data_panel tr:even").addClass("data_record_tr_even");
    $("table.data_panel tr").mouseover(function(){
         $(this).addClass("data_record_over");
    });
    $("table.data_panel tr").mouseout(function(){
         $(this).removeClass("data_record_over");
    });
}

/**
 * 清空表单 
 */
function cleanForm(formSelector){
	$(':input',formSelector).not(':button,:submit,:reset,:hidden').val('');
}

/**
 * 通过按钮打开页面
 */
function showUrlByButton(url){
	 window.location=url
}