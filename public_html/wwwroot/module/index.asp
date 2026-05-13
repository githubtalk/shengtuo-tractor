<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/Function.asp"-->
<!--#include file="../Inc/webset.asp"-->
<!--#include file="../Inc/CSQL.asp" -->
<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->
<!--#include file="nav.asp" -->
<!--#include file="home_url.asp" -->
<%
'产品显示
set rs=server.createobject("adodb.recordset") 
exec="select * from shop where homeshow = 1 order by px_id asc,id desc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无产品！"
end if

For i=1 To product_num
if rs.eof then exit for

Lankecms_products = Lankecms_products & chr(9) & chr(9) &"<li>"&vbcrlf
Lankecms_products = Lankecms_products & chr(9) & chr(9) &"<a href='"&root&"/products/"&rs("id")&".html' title='"&CSQL(rs("title"))&"'><img name='picautozoom' class='img_border' src='"&root&rs("img")&"' width='155' height='125'/></a>"&vbcrlf
Lankecms_products = Lankecms_products & chr(9) & chr(9) &"<p><a href='"&root&"/products/"&rs("id")&".html' title='"&CSQL(rs("title"))&"'>"&left(rs("title"),50)&"</a></p>"&vbcrlf
Lankecms_products = Lankecms_products & chr(9) & chr(9) &"</li>"&vbcrlf

rs.movenext 
next
rs.close
set rs=nothing

'首页新闻
set newrs=server.createobject("adodb.recordset") 
newsql="select top 6 * from news order by hits asc,id desc" 
newrs.open newsql,conn,1,1 
if newrs.eof and newrs.bof then
response.Write("暂无新闻!")
end if

do while not newrs.eof

Lankecms_news = Lankecms_news & chr(9) & chr(9) &"<li><a href='"&root&"/News/"& newrs("id")&".html' title='"&newrs("title")&"'>"&left(newrs("title"),35) &"</a><div class='time'>"&formatdatetime(newrs("data"),2)&"</div></li>"&vbcrlf

newrs.movenext 
loop 

newrs.close
set newrs=nothing


'公司简介
dim Lankecms_about
exec="select * from [about] where id= 2"
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1
if rs.eof then
response.write "不存在此数据"
end if 
Lankecms_about = Lankecms_about & ""&left(RemoveHTML(rs("body")),670)&"...[<a href='about/2.html'>More</a>]"&vbcrlf

%>
<!--#include file="left.asp" -->
<!--#include file="adv.asp" -->
<!--#include file="hot.asp" -->
<!--#include file="flink.asp" -->
<!--#include file="eqq.asp" -->