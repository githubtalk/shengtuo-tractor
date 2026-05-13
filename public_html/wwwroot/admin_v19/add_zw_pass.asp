<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<%
set rs=server.createobject("adodb.recordset")
sql="select zw_name,sex,nn1,nn2,xueli,renshu,yaoqiu,data from job"
rs.open sql,conn,1,3
zw_name=request.form("zw_name")
sex=request.form("sex")
nn1=request.form("nn1")
nn2=request.form("nn2")
xueli=request.form("xueli")
renshu=request.form("renshu")
yaoqiu=request.form("yaoqiu")
if zw_name="" then 
response.Write("<script language=javascript>alert('职位名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if renshu="" then 
response.Write("<script language=javascript>alert('招聘人数不能为空!');history.go(-1)</script>") 
response.end 
end if
if yaoqiu="" then 
response.Write("<script language=javascript>alert('职位要求不能为空!');history.go(-1)</script>") 
response.end 
end if
rs.addnew
rs("zw_name")=zw_name
rs("sex")=sex
rs("nn1")=nn1
rs("nn2")=nn2
rs("xueli")=xueli
rs("renshu")=renshu
rs("yaoqiu")=yaoqiu
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
%>
<%
Response.Write "<script>alert('职位发布成功！');window.location.href='admin_zw.asp';</script>" 
%>

