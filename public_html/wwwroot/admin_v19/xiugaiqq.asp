<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!-- #include file="../vars.asp" -->
<!--#include file="../website.asp"-->
<%
  if session("upload_site") <> website then
  response.write "<script>alert('非法操作，请先登陆后再进行操作！');window.location.href='index.asp';</script>"
  end if
%>
<%
'######################################
' 蓝科外贸网站管理系统英文版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.co
'######################################
%>
<%
if Request.QueryString("action")="ok" then
	c_isqq=Request.Form("c_isqq")
	c_qq=Request.Form("c_qq")
	tt_qq=Request.Form("tt_qq")
	tt_skype=Request.Form("tt_skype")
	
	if c_qq=""  then 
    response.Write("<script language=""javascript"">alert(""请填写MSN号码！"");window.location.href='xiugaiqq.asp';</script>") 
    response.end 
    end if
	if tt_qq=""  then 
    response.Write("<script language=""javascript"">alert(""请填写MSN名称！"");window.location.href='xiugaiqq.asp';</script>") 
    response.end 
    end if
	
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	path = Server.MapPath("../vars.asp")
	set file = fso.OpenTextFile(path,2,TRUE)

	file.write(chr(60)&chr(37)) & vbcrlf
	file.write("c_isqq="""&c_isqq&"""") & vbcrlf
	file.write("c_qq="""&c_qq&"""") & vbcrlf
	file.write("tt_qq="""&tt_qq&"""") & vbcrlf
	file.write("tt_skype="""&tt_skype&"""") & vbcrlf
	file.write(chr(37)&chr(62)) & vbcrlf  
	
	file.close
	
	set file = nothing
	set fso = nothing
	Response.Write("<script>alert('更新成功!');</script>")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#F7F7F7"><div align="left"><strong>修改密码</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="8" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
      <form name="form1" method="post" action="?action=ok">
        
        <tr bgcolor="#F7F7F7">
          <td width="13%">MSN开关：</td>
          <td width="87%">
          <input type="radio" name="c_isqq" value="1" <%if c_isqq="1" then Response.Write("checked")%>>开
          <input type="radio" name="c_isqq" value="0" <%if c_isqq="0" then Response.Write("checked")%>>关
          </td>
        </tr>
        
        <tr>
          <td>MSN号码列表：</td>
          <td><input name="c_qq" type="text" value="<%=c_qq%>" size="50" /> 
          *每个MSN号码之间用半角逗号&quot;,&quot;隔开,不要出现多余逗号,例如：10000,10001,10002</td>
        </tr>
        
        <tr>
          <td>MSN名称：</td>
          <td><input name="tt_qq" type="text" value="<%=tt_qq%>" size="50" /> 
          <span style="color:#FF0000;"><b>*注意1：MSN的名称个数必须与MSN号码的个数相等！ 注意2：MSN名称必须用英文！</b></span></td>
        </tr>
        
        <tr>
          <td>Skype帐号：</td>
          <td><input name="tt_skype" type="text" value="<%=tt_skype%>" size="50" /> 
          *每个Skype帐号之间用半角逗号&quot;,&quot;隔开,不要出现多余逗号。</td>
        </tr>
          <td colspan="2" bgcolor="#F7F7F7"><input type="submit" name="button" value="确认修改" />
          </td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
</body>
</html>
