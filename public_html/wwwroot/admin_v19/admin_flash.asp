<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<%
'######################################
' 蓝科外贸网站管理系统英文版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>幻灯广告管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>幻灯广告管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from flash order by px_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无广告！"
else
rs.PageSize =20 '每页记录条数
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
<%For i=1 To x%>
<form  name="add" method="post" action="admin_flash.asp?xiugaipx=ok">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td width="25%" bgcolor="#FFFFFF"><input name="id" type="hidden" id="id" value="<%=rs("id")%>" />
            <label>
            标题：
            <input name="title" type="text" value="<%=rs("title")%>">
            </label></td>
          <td width="30%" bgcolor="#FFFFFF">地址：
            <input name="link" type="text" value="<%=rs("link")%>">          </td>
          <td width="19%" bgcolor="#FFFFFF">排序： 
            <input name="px_id" type="text" value="<%=rs("px_id")%>" size="2"></td>
          <td width="13%" bgcolor="#FFFFFF"><label>
            
            <input type="button" name="Submit3" value="修改" onClick="window.location.href='xiugai_flash.asp?id=<%=rs("id")%>' "  class="btn"/>
          </label></td>
          <td width="13%" bgcolor="#FFFFFF"><input type="button" name="Submit" value="删除" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_flash.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
        </tr>
      </table></form>
      <%rs.movenext
next
%>
    <%
end if
%></td>
  </tr>
</table>
<br>
</body>
</html>
<% 
if Request.QueryString("xiugaipx")="ok" then
id=request("id") 
sql="select * from flash where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("title")=request.form("title") 
rs("link")=request.form("link") 
rs("px_id")=request.form("px_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""修改当前记录成功！"");window.location.href='admin_flash.asp';</script>")
end if
%> 
<%
if request("act")="del" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from flash where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('刪除成功！');window.location.href='admin_flash.asp';</script>" 
end if
%>
