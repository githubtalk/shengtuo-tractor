<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
'######################################
' 蓝科外贸网站管理系统英文版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>
<% 
exec="select * from about where id="& request.QueryString("id") 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
<html>
<head>
<title>修改页面</title>
	<link rel="stylesheet" href="kindeditor_4.1.5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_4.1.5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_4.1.5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_4.1.5/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor_4.1.5/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="body"]', {
				cssPath : 'kindeditor_4.1.5/plugins/code/prettify.css',
				uploadJson : 'kindeditor_4.1.5/asp/upload_json.asp',
				fileManagerJson : 'kindeditor_4.1.5/asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
    
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#FFFFFF"><div align="center">
      <table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td height="30" bgcolor="#F7F7F7"><div align="center"><strong>修改页面</strong><span class="text2"></span></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><form action="updata_about.asp" method="post"  name="myform"/>
      <table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">标题<font color="#FF0000"> (英文)</font></div></td>
          <td width="85%" bgcolor="#F7F7F7"><input name="title" type="text" id="title" value="<%=rs("title")%>" size="40"> <input name="id" type="hidden" id="id" value="<%=request.querystring("id")%>" /></td>
        </tr>
        
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">关键字<font color="#FF0000"> (英文)</font></div></td>
          <td bgcolor="#F7F7F7"><%
ProductNo=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
%><label>
            <input type="text" name="keyword" id="keyword" value="<%=rs("keyword")%>" size="75">
          </label></td>
        </tr>
                <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">描 述<font color="#FF0000"> (英文)</font></div></td>
          <td width="85%" bgcolor="#F7F7F7"><textarea id="description2" name="description2" cols="45" rows="7"><%=rs("description2")%></textarea></td>
        </tr>
        
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">内容<font color="#FF0000"> (英文)</font></div></td>
          <td bgcolor="#F7F7F7">
          <textarea id="content1" name="body" style="width:700px;height:350px;visibility:hidden;"><%=replace(rs("body"),"'","&#39;")%></textarea>
          <p>&nbsp;</p>
          </td>
        </tr>
        <tr>
          <td bgcolor="#F7F7F7">&nbsp;</td>
          <td bgcolor="#F7F7F7"><input type="submit" name="button"  value="提交修改" /></td>
        </tr>
      </table>
        </form>
    </td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
  </tr>
</table>
</body>
</html>
