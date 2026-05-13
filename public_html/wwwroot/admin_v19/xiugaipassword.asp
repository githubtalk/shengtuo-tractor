<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
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
exec="select * from admin" 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
function check(){
     if (document.add.form_password.value.length=="")
     {
           alert("密码不能为空!");
           document.add.form_password.focus();
           return false;
     }
     
     if (document.add.form_password.value!=document.add.form_password2.value)
     {
           alert("两次输入密码不一致，请重新输入！");
           document.add.form_password2.focus();
           return false;
     }
           return true;
}

</script>
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#F7F7F7"><div align="left"><strong>修改密码</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="8" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
      <form action="updata_password.asp" method="post"  name="add" id="add" onsubmit="return check()">
        
        <tr>
          <td width="13%">登陆帐号</td>
          <td width="59%"><input name="form_admin" type="text" value="<%=session("admin")%>" size="30" /></td>
        </tr>
        
        <tr>
          <td>新密码</td>
          <td><input name="form_password" type="text" id="form_password" size="30" /></td>
        </tr>
        <tr>
          <td>确认密码</td>
          <td><input name="form_password2" type="text" id="form_password2" size="30" /></td>
        </tr>
        <tr>
          <td colspan="2"><input type="submit" name="button" id="button" value="修改密码" />
              <input type="reset" name="button2" id="button2" value="重置" /></td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
</body>
</html>
