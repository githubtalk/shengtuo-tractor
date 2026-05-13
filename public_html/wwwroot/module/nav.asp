<%
dim Lankecms_nav,Lankecms_eanv
set menu=server.createobject("adodb.recordset") 
exec="select * from menu  where show=1 order by px_id asc" 
menu.open exec,conn,1,1 
do while not menu.eof

Lankecms_nav = Lankecms_nav & chr(9) & "<li><a href='"&root&menu("url")&"' target='"&menu("target")&"'>"&(menu("title"))&"</a></li>"&vbcrlf
Lankecms_enav = Lankecms_enav & chr(9) & "<li><a href='"&root&menu("eurl")&"' target='"&menu("target")&"'>"&(menu("etitle"))&"</a></li>"&vbcrlf

menu.movenext 
loop 
%>