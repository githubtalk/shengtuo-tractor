<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/Function.asp"-->
<!--#include file="../Inc/webset.asp"-->
<!--#include file="../Inc/home_url.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->
<%
'关于我们
set rse3=server.CreateObject("adodb.recordset")
rse3.open "select * from about order by px_id asc",conn,1,1

while not rse3.eof

aboutfl = aboutfl & "<DIV>● <A title='"&(rse3("title"))&"' href='"&Lankecms_wz&root&"/about/"&rse3("id")&".html'>"&(rse3("title"))&"</A></DIV>"&vbcrlf

rse3.movenext
wend
rse3.close
set rse3=nothing


'产品分类
dim rse
set rse=server.CreateObject("adodb.recordset")
rse.open "select * from shop_fl where sid = 0 order by px_id asc",conn,1,1
while not rse.eof

shopfl = shopfl & "<DIV>● <A title='"&(rse("title"))&"' href='"&Lankecms_wz&root&"/products/?id="&rse("id")&"'>"&(rse("title"))&"</A></DIV>"&vbcrlf

rse.movenext
wend
rse.close
set rse=nothing


'新闻分类
set rse2=server.CreateObject("adodb.recordset")
rse2.open "select * from news_fl order by px_id asc",conn,1,1
while not rse2.eof

newsfl = newsfl & "<DIV>● <A title='"&(rse2("title"))&"' href='"&Lankecms_wz&root&"/news/?id="&rse2("id")&"'>"&(rse2("title"))&"</A></DIV>"&vbcrlf

rse2.movenext
wend
rse2.close
set rse2=nothing


'案例分类
set rse4=server.CreateObject("adodb.recordset")
rse4.open "select * from cases_fl order by px_id asc",conn,1,1

while not rse4.eof

casesfl = casesfl & "<DIV>● <A title='"&(rse4("title"))&"' href='"&Lankecms_wz&root&"/cases/?id="&rse4("id")&"'>"&(rse4("title"))&"</A></DIV>"&vbcrlf

rse4.movenext
wend
rse4.close
set rse4=nothing


'下载分类
set rse5=server.CreateObject("adodb.recordset")
rse5.open "select * from download_fl order by px_id asc",conn,1,1

while not rse5.eof

downloadfl = downloadfl & "<DIV>● <A title='"&(rse5("title"))&"' href='"&Lankecms_wz&root&"/Download/?id="&rse5("id")&"'>"&(rse5("title"))&"</A></DIV>"&vbcrlf

rse5.movenext
wend
rse5.close
set rse5=nothing



'产品展示
exec5="select * from shop"
set rs5=server.createobject("adodb.recordset") 
rs5.open exec5,conn,1,1

while not rs5.eof

showshop = showshop & "<A href='"&Lankecms_wz&root&"/products/"&rs5("id")&".html' target='_blank'>"&rs5("title")&"</A> | "&vbcrlf

rs5.movenext
wend
rs5.close
set rs5=nothing


'新闻展示
exec6="select * from news"
set rs6=server.createobject("adodb.recordset") 
rs6.open exec6,conn,1,1

while not rs6.eof

shownews = shownews & "<A href='"&Lankecms_wz&root&"/News/"&rs6("id")&".html' target='_blank'>"&rs6("title")&"</A> | "&vbcrlf

rs6.movenext
wend
rs6.close
set rs6=nothing


'案例展示
exec7="select * from cases"
set rs7=server.createobject("adodb.recordset") 
rs7.open exec7,conn,1,1

while not rs7.eof

showcases = showcases & "<A href='"&Lankecms_wz&root&"/cases/"&rs7("id")&".html' target='_blank'>"&rs7("title")&"</A> | "&vbcrlf

rs7.movenext
wend
rs7.close
set rs7=nothing


'下载展示
exec8="select * from download"
set rs8=server.createobject("adodb.recordset") 
rs8.open exec8,conn,1,1

while not rs8.eof

showdownload = showdownload & "<A href='"&Lankecms_wz&root&"/download/"&rs8("id")&".html' target='_blank'>"&rs8("title")&"</A> | "&vbcrlf

rs8.movenext
wend
rs8.close
set rs8=nothing

%>