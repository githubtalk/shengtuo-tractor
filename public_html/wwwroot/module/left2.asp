<%
'单页分类
dim rse
set rse=server.CreateObject("adodb.recordset")
rse.open "select * from about order by px_id asc",conn,1,1
while not rse.eof

Lankecms_leftnav = Lankecms_leftnav & chr(9) & chr(9) & "<li><a href='"&root&"/about/"&rse("id")&".html'>"&(rse("title"))&"</a></li>"&vbcrlf

rse.movenext
wend
rse.close
set rsf=nothing
%>