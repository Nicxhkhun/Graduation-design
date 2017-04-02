 /**
  * 返回选择的 checkBox 的 value 属性 只能选择一个
  * 
  * 
  * @param checkboxname --表格单选框name
  * @returns {string} value 字符串
  */
 function getSelectedCheckBoxValue(checkboxName){
	 var selectRows=getSelectedCheckBoxValueN(checkboxName);
	 if(selectRows.length != 1){
		 alert("请选择一行数据进行操作");
		 return "";
	 }
 	
 	return selectRows[0];
 }
 
 /**
  * 返回选择的 checkBox 的 value 属性 多个
  * 
  * 
  * @param checkboxname --表格单选框name
  * @returns {Array} 行数组
  */
 function getSelectedCheckBoxValueN(checkboxName){
	 var selectRows=[];
	 var checks=document.getElementsByName(checkboxName);
	//遍历所有checkbox 	
	var id="";
 	
 	for(var i=0;i<checks.length;i++){
 		//获取选中的行
 		if(checks[i].checked){
 			selectRows.push(checks[i].value);//去掉表头
 		}
 	}	
 	
 	return selectRows;
 }
 

/**
 * @param tableid--表格id
 * @param checkboxname --表格单选框name
 * @returns {Array} 行数组
 */
 function getSelected(tableid,checkboxname){
 	var selectRows=[];
 	var rows=document.getElementById(tableid).rows;//查询出的数据
 	var checks=document.getElementsByName(checkboxname);//checkbox
 	//遍历所有checkbox
 	for(var i=0;i<checks.length;i++){
 		//获取选中的行
 		if(checks[i].checked){
 			selectRows.push(rows[i+1]);//去掉表头
 		}
 	}
 	return selectRows;
 }
 
