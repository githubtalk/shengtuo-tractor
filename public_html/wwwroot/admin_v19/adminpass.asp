<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<!--#include file="sqlerr.asp" -->
<!--#include file="md5.asp"-->
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
admin=request.form("admin")
password=md5(Request("password"))
VerifyCode=request.form("VerifyCode") 
if admin=""  then 
response.Write("<script language=javascript>alert('用户名不能为空!');history.go(-1)</script>") 
response.end
end if 

if  password="" then 
response.Write("<script language=javascript>alert('密码不能为空!');history.go(-1)</script>") 
response.end
end if 

if  VerifyCode="" then 
response.Write("<script language=javascript>alert('验证码不能为空!');history.go(-1)</script>") 
response.end
end if 

if cstr(Session("GetCode"))<>cstr(Request.Form("VerifyCode")) then
response.Write("<script language=javascript>alert('验证码错误!');history.go(-1)</script>")
response.End
end if

sql="select * from admin where admin='"&admin&"' and password='"&password&"'" 
set rs=conn.execute(sql) 
if rs.eof or rs.bof then 
response.write "<script language=javascript>"
response.write "alert('帐号密码错误，请重新输入!');"
response.write "javascript:history.go(-1);"
response.write "</script>" 
else 

session.Timeout = 999
Server.ScriptTimeOut=999999
session("admin")=admin
response.redirect "admin_index.asp" 
end if 

%> 

