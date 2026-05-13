<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from cases"
rs.open sql,conn,1,3
title=request.form("title")
ProductNo=request.form("ProductNo")
body=request.form("body")
ssfl=request.form("ssfl")
img=request.form("img")
description2=request.form("description2")
keyword=request.form("keyword")

if title=""  then 
response.Write("<script language=javascript>alert('案例中文名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if body="" then 
response.Write("<script language=javascript>alert('案例中文内容不能为空!');history.go(-1)</script>") 
response.end 
end if

rs.addnew
rs("title")=title
rs("ProductNo")=ProductNo
rs("body")=body
rs("ssfl")=ssfl
rs("img")=img
rs("description2")=description2
rs("keyword")=keyword
rs.update
id  = rs("id")
%>
<!--#include file="cases_html_add.asp"-->
<%
rs.close
set rs=nothing
conn.close
set conn = nothing
%>