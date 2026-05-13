<!--#include file="../Inc/utf-8.asp"-->
<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/conn.asp"-->
<!--#include file="../Inc/CSQL.asp" -->
<!--#include file="../Inc/webset.asp" -->
<!--#include file="../Inc/from_eamil.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sql="select title,sl,name,tel,mail,bz,data from dg"
rs.open sql,conn,1,3
title=CSQL(request.form("title"))
sl=CSQL(request.form("sl"))
name=CSQL(request.form("name"))
tel=CSQL(request.form("tel"))
mail=CSQL(request.form("mail"))
bz=CSQL(request.form("bz"))

if title=""  then 
response.Write("<script language=javascript>alert('Product names can not be empty!');history.go(-1)</script>") 
response.end 
end if
if sl=""  then 
response.Write("<script language=javascript>alert('The number of orders can not be empty!');history.go(-1)</script>") 
response.end 
end if
if name="" then 
response.Write("<script language=javascript>alert('Can not contact null!');history.go(-1)</script>") 
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
rs("sl")=sl
rs("name")=name
rs("tel")=tel
rs("mail")=mail
rs("bz")=bz
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
%>
<%
email = tomail
sendtype=0  '方式类型

Set JMail = Server.CreateObject("JMail.Message") 
JMail.silent = true
JMail.Charset = "gb2312" 
JMail.ISOEncodeHeaders = False

JMail.From = From_mail    '//**********请修改为自己的邮件帐号*********
JMail.FromName = name&" 的订单"     '//**********请修改发件人姓名***************
JMail.Subject = title              '//**********请修改邮件主题*****************

JMail.MailServerUserName = From_mail   '//**********请修改为自己的邮件帐号*********
JMail.MailServerPassword = mail_Password        '//**********请修改为自己的邮件密码*********

JMail.Priority = 1 

JMail.AddHeader "Originating-IP", Request.ServerVariables("REMOTE_ADDR") 

JMail.AddRecipient(email)


htmlText = htmlText &"您好！"& vbcrlf
htmlText = htmlText & "订购产品：" & title & vbcrlf
htmlText = htmlText & "订购数量：" &sl& vbcrlf
htmlText = htmlText & "联系人：" &name& vbcrlf
htmlText = htmlText & "联系电话：" &tel& vbcrlf
htmlText = htmlText & "联系邮箱：" &mail& vbcrlf
htmlText = htmlText & "备注：" &bz& vbcrlf
htmlText = htmlText & surl & vbcrlf
htmlText = htmlText & vbcrlf
htmlText = htmlText & "发送时间" &now()& vbcrlf
htmlText = htmlText & "  "

JMail.Body = htmlText

JMail.Send(mail_Send)      '//**********请把mail.abc.com修改为自己的邮件SMTP地址*********
JMail.Close() 
Set JMail = Nothing
%>

<%
Response.Write "<script>alert('Congratulations! Your order has been submitted to the success! Please wait for the customer to get in touch with you!');window.location.href='index.asp';</script>" 
%>

