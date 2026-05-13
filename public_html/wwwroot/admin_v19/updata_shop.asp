<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<%
dim rs,sql,rs2,sql2,sid,id 
id=request("id")
title=request.form("title")
ProductNo=request.form("ProductNo")
body=request.form("body")
ssfl=request.form("ssfl")
img =request.form("img")
description2=request.form("description2")
keyword=request.form("keyword")
left_hot=request.form("left_hot")
price=request.form("price")
px_id=request.form("px_id")
homeshow=request.form("homeshow")
if homeshow ="" then
homeshow = 0
end if
if left_hot ="" then
left_hot = 0
end if

if title=""  then 
response.Write("<script language=javascript>alert('产品中文名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if body="" then 
response.Write("<script language=javascript>alert('产品中文内容不能为空!');history.go(-1)</script>") 
response.end 
end if
if px_id="" then 
response.Write("<script language=javascript>alert('排序号不能为空!');history.go(-1)</script>") 
response.end 
end if
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if

set rs2=server.createobject("adodb.recordset")
sql2="select * from shop_fl where id = "&ssfl&""
rs2.open sql2,conn,1,1
sid = rs2("sid")
rs2.close
set rs2=nothing

sql="select * from shop where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("title")=title
rs("ProductNo")=ProductNo
rs("body")=body
rs("ssfl")=ssfl
rs("img")=img
rs("sid")=sid
rs("description2")=description2
rs("keyword")=keyword
rs("left_hot")=left_hot
rs("price")=price
rs("px_id")=px_id
rs("homeshow")=homeshow
rs.update
%> 
<!--#include file="showshop_html_add.asp"-->
<%
rs.close
set rs=nothing
conn.close
set conn = nothing
%> 
