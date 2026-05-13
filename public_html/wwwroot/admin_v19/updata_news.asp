<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<% 
id=request("id") 
sql="select * from news where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("title")=request.form("title")
rs("body")=request.form("body")
rs("ssfl")=request.form("ssfl")
rs("hits")=request.form("hits")
rs("description2")=request.form("description2")
rs("keyword")=request.form("keyword")
rs("data")=now()
rs.update
%> 
<!--#include file="news_html_add.asp"-->
<%
rs.close
set rs=nothing
conn.close
set conn = nothing
%> 