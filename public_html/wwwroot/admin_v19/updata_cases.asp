<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<%
dim rs,sql,id 
id=request("id")
title=request.form("title")
ProductNo=request.form("ProductNo")
body=request.form("body")
ssfl=request.form("ssfl")
img =request.form("img") 
description2=request.form("description2")
keyword=request.form("keyword")

if title=""  then 
response.Write("<script language=javascript>alert('产品中文名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if body="" then 
response.Write("<script language=javascript>alert('产品中文内容不能为空!');history.go(-1)</script>") 
response.end 
end if

sql="select * from cases where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("title")=title
rs("ProductNo")=ProductNo
rs("body")=body
rs("ssfl")=ssfl
rs("img")=img
rs("description2")=description2
rs("keyword")=keyword
rs("data")=now()
rs.update
%> 
<!--#include file="cases_html_add.asp"-->
<%
rs.close
set rs=nothing
conn.close
set conn = nothing
%>