<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<% 
id=request("id")  
sql="select * from job where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("zw_name")=request.form("zw_name")
rs("sex")=request.form("sex")
rs("nn1")=request.form("nn1")
rs("nn2")=request.form("nn2")
rs("xueli")=request.form("xueli")
rs("renshu")=request.form("renshu")
rs("yaoqiu")=request.form("yaoqiu")
rs.update 
rs.close 
response.write "<script>alert('职位修改成功!');window.location.href='admin_zw.asp';</script>"  
%> 

