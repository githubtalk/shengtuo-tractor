<%
'下一页
newrs=server.CreateObject("adodb.recordset")
sql="select top 1 * from news where id>"&a1&" order by id"
set newrs=conn.execute(sql)
if newrs.eof then
Lankecms_next = "No next"
else
a2=newrs("id")
next_title= left(newrs("title"),40)
Lankecms_next = "NEXT：<a href='"&a2&".html' title='"&next_title&"'>"&next_title&"</a>"
end if

'上一页
headrs=server.CreateObject("adodb.recordset")
sql="select top 1 * from news where id<"&a1&" order by id desc"
set headrs=conn.execute(sql)
if headrs.eof then
Lankecms_prev = "No previous"
else
a0=headrs("id")
prev_title=left(headrs("title"),40)
Lankecms_prev = "PREVIOUS：<a href='"&a0&".html' title='"&prev_title&"'>"&prev_title&"</a>"
end if
%>