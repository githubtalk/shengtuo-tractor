<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
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
set rs=server.createobject("adodb.recordset")
sql="select * from news"
rs.open sql,conn,1,3
title=request.form("title")
body=request.form("body")
ssfl=request.form("ssfl")
hits=request.form("hits")
description2=request.form("description2")
keyword=request.form("keyword")

if title=""  then 
response.Write("<script language=javascript>alert('中文标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if body="" then 
response.Write("<script language=javascript>alert('中文内容不能为空!');history.go(-1)</script>") 
response.end 
end if

rs.addnew
rs("title")=title
rs("body")=body
rs("ssfl")=ssfl
rs("hits")=hits
rs("description2")=description2
rs("keyword")=keyword
rs.update
id  = rs("id")
%>
<!--#include file="news_html_add.asp"-->
<%
rs.close
set rs=nothing
conn.close
set conn = nothing
%>