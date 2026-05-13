<%
'下载分类
dim rse
set rse=server.CreateObject("adodb.recordset")
rse.open "select * from download_fl order by px_id asc",conn,1,1
while not rse.eof

Lankecms_leftnav = Lankecms_leftnav & "<li><a href='"&root&"/Download/?id="&rse("id")&"'>"&(rse("title"))&"</a></li>"&vbcrlf

rse.movenext
wend
rse.close
set rsf=nothing
%>