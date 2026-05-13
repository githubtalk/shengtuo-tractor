<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<%
'######################################
' 蓝科外贸网站管理系统中英文双语版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>订单管理</strong> 【<a href="javascript:void(null)" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_dg.asp?act=alldel';}else{history.go(0);}">删除全部订单</a>】</div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from dg order by id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无订单！"
else
rs.PageSize =10 '每页记录条数
iCount=rs.RecordCount '记录总数
iPageSize=rs.PageSize
maxpage=rs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
rs.AbsolutePage=Page
if page=maxpage then
x=iCount-(maxpage-1)*iPageSize
else
x=iPageSize
end if	
%>
<%For i=1 To x%><div style="margin-top:10px;">
      <table width="100%" border="0" align="center" cellpadding="6" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC">
        <tr>
          <td width="13%" bgcolor="#FFFFFF">编号：<b><%=rs("id")%></b></td>
          <td width="21%" bgcolor="#FFFFFF">名称：<%=rs("title")%></td>
          <td width="15%" bgcolor="#FFFFFF">联系人：<%=rs("name")%></td>
          <td width="15%" bgcolor="#FFFFFF"><%=rs("tel")%></td>
          <td width="17%" bgcolor="#FFFFFF"><%=rs("mail")%></td>
          <td width="19%" bgcolor="#FFFFFF"><div align="center">
            <input type="button" name="Submit" value="删除订单" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_dg.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> 
          </div></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF">备注</td>
          <td colspan="4" bgcolor="#FFFFFF"><%=rs("bz")%></td>
          <td bgcolor="#FFFFFF"><div align="center">时间:<%=rs("data")%></div></td>
        </tr>
      </table>
</div>
      <%rs.movenext
next
%>
    <%
end if
%></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><%'以下显示分页
 call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
rs.close
set rs=nothing
%></td>
  </tr>
</table>
</body>
</html>
<%
if request("act")="del" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from dg where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('订单刪除成功！');window.location.href='admin_dg.asp';</script>" 
end if
%>

<%
if request("act")="alldel" then
conn.execute("delete from dg") 
Response.Write "<script>alert('刪除全部订单成功！');window.location.href='admin_dg.asp';</script>" 
end if
%>