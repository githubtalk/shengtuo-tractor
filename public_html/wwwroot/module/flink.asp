<%
dim rsk,Lankecms_flink
set rsk=server.CreateObject("adodb.recordset")
rsk.open "select * from link order by px_id asc",conn,1,1
while not rsk.eof

Lankecms_flink = Lankecms_flink & chr(9) & "<a href='"&rsk("url")&"' target='_blank'>"&rsk("name")&"</a> | "&vbcrlf

rsk.movenext
wend
rsk.close
set rsc=nothing
%>