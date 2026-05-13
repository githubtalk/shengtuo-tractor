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
set config=server.createobject("adodb.recordset") 
exec="select top 10 * from  config  " 
config.open exec,conn,1,1
font_size = config("font_size")
font_show = config("font_show")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网站设置</title>
<LINK href="images/style.css" type=text/css rel=stylesheet>

</head>
<body>
<form  name="myform" method="post" action="updata_wzsz.asp">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="35" bgcolor="#F7F7F7"><div style="padding-left:20px;"><strong>网站设置</strong></div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="font">
      <tr bgcolor="#FFFFFF">
        <td height="25" width="13%">网站名称：</td>
        <td colspan="3"><input name="title" type="text" value="<%=config("title")%>" size="50" /> <input name="id" type="hidden" id="id" value="<%=config("id")%>" /></td>
      </tr>
      <tr>
        <td height="25" width="13%" bgcolor="#F7F7F7">网站域名：</td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="url" type="text"  value="<%=config("url")%>" size="50" /> <font color="#FF0000">网址后面不需要加"/"</font></td>
      </tr>
      <tr>
        <td height="25" width="13%" bgcolor="#FFFFFF">联系人：</td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="name" type="text" value="<%=config("name")%>" size="20" /></td>
      </tr>
      <tr>
        <td height="25" width="13%" bgcolor="#F7F7F7">公司邮箱：</td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="mail" type="text" value="<%=config("mail")%>"  size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="13%" bgcolor="#FFFFFF">公司电话：</td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="tel" type="text" value="<%=config("tel")%>" size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="13%" bgcolor="#F7F7F7">公司传真：</td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="fax" type="text"  value="<%=config("fax")%>" size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="13%" bgcolor="#FFFFFF">公司地址：</td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="dz" type="text" id="textfield8" value="<%=config("dz")%>" size="50" /></td>
      </tr>
      <tr>
        <td width="13%" height="5" bgcolor="#F7F7F7">备案编号和统计代码：</td>
        <td colspan="3" bgcolor="#F7F7F7">
        <textarea id="beian" name="beian" cols="50" rows="3"><%=config("beian")%></textarea>
        <%=config("tongji")%>
        </td>
      </tr>
      <tr>
        <td width="13%" bgcolor="#F7F7F7">网站LOGO</td>
        <td colspan="3" valign="top" bgcolor="#F7F7F7"><input name="img" type="text" value="<%=config("bg")%>" size="30" maxlength="50"/> <iframe src="upload_youyiweb.asp" frameborder=0 scrolling=no width="360" height="24"></iframe></td>
      </tr>   
      <tr>
        <td width="13%" height="2" bgcolor="#F7F7F7">网页关键字：</td>
        <td bgcolor="#F7F7F7"><label>
          <input name="keywords" type="text" value="<%=config("keywords")%>" size="50"  />
        </label></td>
        <td colspan="2" bgcolor="#F7F7F7">&nbsp;</td>
        </tr>
      <tr>
        <td height="3" bgcolor="#FFFFFF">网站描述：</td>
        <td bgcolor="#FFFFFF"><textarea name="description" cols="50" rows="4"><%=config("description")%></textarea></td>
        <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
      <tr>
        <td width="13%" height="12" bgcolor="#FFFFFF">分享代码 ：</td>
        <td colspan="3" bgcolor="#FFFFFF"><textarea name="share" cols="50" rows="4"><%=config("share")%></textarea></td>
      </tr>
      <tr>
        <td width="13%" height="12" bgcolor="#F7F7F7">版权信息：</td>
        <td colspan="3" bgcolor="#F7F7F7"><textarea name="copyright" cols="50" rows="4"><%=config("copyright")%></textarea></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#FFFFFF">&nbsp;</td>
        <td colspan="3" bgcolor="#FFFFFF"><label>
          <input type="submit" name="button" id="button" value="确定修改" />
        </label></td>
      </tr>
      
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
<%
config.close
set config = nothing
conn.close
set conn = nothing
%>