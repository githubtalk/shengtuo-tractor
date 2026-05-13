<%
'产品大类
dim rse,did
set rse=server.CreateObject("adodb.recordset")
rse.open "select * from shop_fl where sid = 0 order by px_id asc",conn,1,1
while not rse.eof
did = rse("id")

Lankecms_leftnav = Lankecms_leftnav & chr(9) & "<li><a href='"&root&"/products/?id="&rse("id")&"'>"&(rse("title"))&"</a></li>"&vbcrlf

if rse("id")= tt or tt2=rse("id") then

'产品小类
dim rsx,execx
set rsx=server.createobject("adodb.recordset") 
execx="select * from shop_fl where sid = "&did&" order by px_id asc" 
rsx.open execx,conn,1,1
do while not rsx.eof

Lankecms_leftnav = Lankecms_leftnav & chr(9) & "<li class='small'><a href='"&root&"/products/?id="&rsx("id")&"'>"&(rsx("title"))&"</a></li>"&vbcrlf

rsx.movenext 
loop
end if

rse.movenext
wend
rse.close
set rsf=nothing
%>