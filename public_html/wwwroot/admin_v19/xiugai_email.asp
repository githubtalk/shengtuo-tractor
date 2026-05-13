<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!-- #include file="../Inc/from_eamil.asp" -->
<%
'######################################
' 蓝科外贸网站管理系统中英文双语版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>
<%
dim product_num,product_width,product_height,plist_num,news_num,nlist_num,hot_num
if Request.QueryString("action")="ok" then
	From_mail=Request.Form("From_mail")
	mail_Password=Request.Form("mail_Password")
	mail_Send=Request.Form("mail_Send")
	
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	path = Server.MapPath("../Inc/from_eamil.asp")
	set file = fso.OpenTextFile(path,2,TRUE)

	file.write(chr(60)&chr(37)) & vbcrlf
	file.write("From_mail="""&From_mail&"""") & vbcrlf
	file.write("mail_Password="""&mail_Password&"""") & vbcrlf
	file.write("mail_Send="""&mail_Send&"""") & vbcrlf
	file.write(chr(37)&chr(62)) & vbcrlf  
	
	file.close
	
	set file = nothing
	set fso = nothing
	Response.Write "<script>alert('更新成功！');window.location.href='xiugai_email.asp';</script>" 
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发信箱设置</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#F7F7F7"><div align="left"><strong><a href="xiugai_webset.asp" style="color:#FF0000">网站属性设置</a> | <a href="xiugai_email.asp">发信箱设置</a></strong></div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="8" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
      <form name="form1" method="post" action="?action=ok">
        
        <tr bgcolor="#F7F7F7">
          <td width="13%">发信箱地址：</td>
          <td width="87%">
          <input name="From_mail" type="text" value="<%=From_mail%>" size="40" /> <font color="#FF0000">*推荐用163邮箱 </font></td>
        </tr>
      
        <tr>
          <td>发信箱登录密码：</td>
          <td><input name="mail_Password" type="password" value="<%=mail_Password%>" size="40" /> <font color="#FF0000">*必填</font></td>
        </tr>
        
         <tr bgcolor="#F7F7F7">
          <td width="13%">SMTP服务器：</td>
          <td width="87%">
          <input name="mail_Send" type="text" value="<%=mail_Send%>" size="40" /></td>
        </tr>
      
        
        
          <td colspan="2"><input type="submit" name="button" value="确认修改" /></td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
</body>
</html>
