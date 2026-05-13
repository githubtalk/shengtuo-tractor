<%
'案例分类
dim rse
set rse=server.CreateObject("adodb.recordset")
rse.open "select * from cases_fl order by px_id asc",conn,1,1
while not rse.eof

Lankecms_leftnav = Lankecms_leftnav & chr(9) & "<li><a href='"&root&"/cases/?id="&rse("id")&"'>"&(rse("title"))&"</a></li>"&vbcrlf

rse.movenext
wend
rse.close
set rsf=nothing
%>