<%
'左侧推荐产品
set rs2=server.createobject("adodb.recordset") 
sql2="select * from shop where left_hot = 1 order by px_id asc,id desc"
rs2.open sql2,conn,1,1

For i=1 To hot_num
if rs2.eof then exit for

Lankecms_hot = Lankecms_hot & chr(9) & "<a href='"&root&"/products/"&rs2("id")&".html' title='"&rs2("title")&"'><img name='picautozoom' class='img_border' src='"&root&rs2("img")&"' width='208' height='208'></a>"&vbcrlf
Lankecms_hot = Lankecms_hot & chr(9) & "<p><a href='"&root&"/products/"&rs2("id")&".html' title='"&rs2("title")&"'>"&left(rs2("title"),26)&"</a></p>"&vbcrlf

rs2.movenext 
next 
rs2.close
set rs2=nothing
%>