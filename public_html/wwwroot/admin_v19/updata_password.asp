<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="md5.Asp" -->

<% 
sql="select * from admin where admin = '"&session("admin")&"' "
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

rs("admin")=request.form("form_admin")

rs("password")=md5(request.form("form_password"))
 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""登陆帐号及密码修改成功，请牢记您帐号及新密码！"");window.location.href='xiugaipassword.asp';</script>")
%> 

