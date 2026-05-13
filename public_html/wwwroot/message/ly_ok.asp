<!--#include file="../Inc/utf-8.asp"-->
<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/conn.asp"-->
<!--#include file="../Inc/CSQL.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sql="select title,xz,name,tel,mail,body,data from book"
rs.open sql,conn,1,3
title=CSQL(request.form("title"))
xz=CSQL(request.form("xz"))
name=CSQL(request.form("name"))
tel=CSQL(request.form("tel"))
mail=CSQL(request.form("mail"))
body=CSQL(request.form("body"))

if title=""  then 
response.Write("<script language=javascript>alert('Message that the title can not be empty!');history.go(-1)</script>") 
response.end 
end if
if name="" then 
response.Write("<script language=javascript>alert('Name can not be empty!');history.go(-1)</script>") 
response.end 
end if
if tel="" then 
response.Write("<script language=javascript>alert('Telephone contact can not be empty!');history.go(-1)</script>") 
response.end 
end if
if cstr(session("GetCode"))<>cstr(request("VerifyCode")) then
   response.write "<script language=javascript> alert('Authcode error,Please input again!');history.go(-1)</script>"
   response.end
end if

rs.addnew
rs("title")=title
rs("xz")=xz
rs("name")=name
rs("tel")=tel
rs("mail")=mail
rs("body")=body
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
%>

<%
Response.Write "<script>alert('Congratulations! Message success！');window.location.href='index.asp';</script>" 
%>

