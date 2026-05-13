<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<% 
id=request("id") 
sql="select * from about where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

title=request.form("title")
body=request.form("body")
description2=request.form("description2")
keyword=request.form("keyword")

if title=""  then 
response.Write("<script language=javascript>alert('标题不能为空，请重新输入!');window.location.href='xiugai_about.asp?id="&id&"'</script>") 
response.end 
end if
if body="" then 
response.Write("<script language=javascript>alert('标题不能为空，请重新输入!');window.location.href='xiugai_about.asp?id="&id&"'</script>") 
response.end 
end if

rs("title")= title
rs("body")= body
rs("description2")= description2
rs("keyword")= keyword
rs.update 
%> 
<!--#include file="about_html_add.asp"-->
<%
rs.close
set rs=nothing
conn.close
set conn = nothing
%> 