<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
dim id,rs,sql
id = request.form("id")
if id = "" or not isnumeric(id) then
response.write "<script>alert('非法操作');history.back();</script>"
response.end
end if 

sql="select * from config where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

if rs.eof then
rs.close
set rs = nothing
conn.close
set conn = nothing
response.write "<script>alert('不存在此数据');history.back();</script>"
response.end
end if 

rs("title")=request.form("title")
rs("url")=request.form("url") 
rs("name")=request.form("name")
rs("mail")=request.form("mail")
rs("tel")=request.form("tel")
rs("fax")=request.form("fax")
rs("dz")=request.form("dz")
rs("copyright")=request.form("copyright")
rs("share")=request.form("share")
rs("beian")=request.form("beian") 
rs("font_show")=request.form("font_show") 
rs("font_size")=request.form("font_size") 
rs("keywords")=request.form("keywords") 
rs("description")=request.form("description") 
rs("bg")=request.form("img") 
rs.update 
rs.close
set rs = nothing
conn.close
set conn = nothing
response.write "<script>alert('网站设置成功!');window.location.href='wzsz.asp';</script>"  
%> 