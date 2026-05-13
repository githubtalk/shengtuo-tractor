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
<html>
<head>
<title>增加新闻</title>
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
          <td height="30" bgcolor="#F7F7F7"><div align="center"><strong>增加新闻</strong></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><FORM method="post" name="myform" action="add_news_pass.asp">
      <table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">新闻标题<font color="#FF0000"> (英文)</font></div></td>
          <td colspan="3" bgcolor="#F7F7F7"><input name="title" type="text" id="title" size="40"></td>
        </tr>
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">新闻分类</div></td>
          <td colspan="3" bgcolor="#F7F7F7"><select name="ssfl" id="select">
            <%
		  dim rsc
		  set rsc=server.CreateObject("adodb.recordset")
		  rsc.open "select * from news_fl",conn,1,1
		  while not rsc.eof
			response.Write("<option value=""" & rsc("id") & """>" & rsc("title") & "</option>")
			rsc.movenext
		wend
		rsc.close
		set rsc=nothing
		  %>
          </select>
          
           &nbsp;&nbsp;&nbsp;新闻排序：<input name="hits" type="text" size="2">
           <font color="#FF0000">（数字越小越靠前。）</font>
          </td>
        </tr>

       <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">关键字<font color="#FF0000"> (英文)</font></div></td>
          <td bgcolor="#F7F7F7"><%
ProductNo=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
%><label>
            <input type="text" name="keyword" id="keyword" size="75">
          </label></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">描 述<font color="#FF0000"> (英文)</font></div></td>
          <td width="85%" bgcolor="#F7F7F7"><textarea id="description2" name="description2" cols="45" rows="7"></textarea></td>
        </tr>
        
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">新闻内容<font color="#FF0000"> (英文)</font></div></td>
          <td colspan="3" bgcolor="#F7F7F7">
          <textarea id="content1" name="body" cols="100" rows="8" style="width:700px;height:350px;visibility:hidden;"></textarea>
          </td>
        </tr>
        <tr>
          <td bgcolor="#F7F7F7">&nbsp;</td>
          <td colspan="3" bgcolor="#F7F7F7"><input type="submit" name="button"  value="確认提交" /></td>
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
