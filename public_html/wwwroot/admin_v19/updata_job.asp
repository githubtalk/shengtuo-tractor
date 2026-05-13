<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<% 
id=request("id")  
sql="select * from config where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

rs("title")=request.form("title")
rs("etitle")=request.form("etitle")
rs("url")=request.form("url") 
rs("name")=request.form("name")
rs("ename")=request.form("ename")
rs("mail")=request.form("mail")
rs("tel")=request.form("tel")
rs("fax")=request.form("fax")
rs("dz")=request.form("dz")
rs("edz")=request.form("edz")
rs("copyright")=request.form("copyright") 
rs("ecopyright")=request.form("ecopyright") 
rs("beian")=request.form("beian") 
rs("font_show")=request.form("font_show") 
rs("font_size")=request.form("font_size") 
rs("js")=request.form("js") 
rs("keywords")=request.form("keywords") 
rs("ekeywords")=request.form("ekeywords") 
rs("description")=request.form("description") 
rs("edescription")=request.form("edescription") 
rs("bg")=request.form("img") 
rs.update 
rs.close 
response.write "<script>alert('网站设置成功!');window.location.href='wzsz.asp';</script>"  
%> 




