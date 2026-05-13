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
<title>友情链接管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>友情链接管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from link order by px_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无友情链接！"
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
<%For i=1 To x%>
<form  name="add" method="post" action="admin_link.asp?xiugaipx=ok">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td width="25%" bgcolor="#FFFFFF"><input name="id" type="hidden" id="id" value="<%=rs("id")%>" />
            <label>
            网站名称：
            <input name="name" type="text" value="<%=rs("name")%>">
            </label></td>
          <td width="30%" bgcolor="#FFFFFF">地址：
            <input name="url" type="text" value="<%=rs("url")%>">          </td>
          <td width="19%" bgcolor="#FFFFFF">排序： 
            <input name="px_id" type="text" value="<%=rs("px_id")%>" size="2"></td>
          <td width="13%" bgcolor="#FFFFFF"><label>
            <input type="submit" name="button" id="button" value="修改链接">
          </label></td>
          <td width="13%" bgcolor="#FFFFFF"><input type="button" name="Submit" value="删除链接" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_link.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
        </tr>
      </table></form>
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
<br>

<table width="95%" border="0" align="center" cellpadding="8" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#F7F7F7"><strong>增加链接</strong></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><form name="form1" method="post" action="admin_link.asp?add_link=ok">
      网站名称：
          <input name="name" type="name">
      地址：
      <input name="url" type="text" value="http://"> 
      排序：
      <input name="px_id" type="text" size="2"> 
        <input type="submit" name="button2" id="button2" value="增加链接">
        <font color="#FF0000">（数字越小越靠前。）        </font>
    </form>
      </td>
  </tr>
</table>
</body>
</html>
<% 
if Request.QueryString("xiugaipx")="ok" then
id=request("id") 
sql="select * from link where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("name")=request.form("name") 
rs("url")=request.form("url") 
rs("px_id")=request.form("px_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""修改链接成功！"");window.location.href='admin_link.asp';</script>")
end if
%> 
<%
if Request.QueryString("add_link")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select name,url,px_id from link"
rs.open sql,conn,1,3
name=request.form("name")
url=request.form("url")
px_id=request.form("px_id")
if name=""  then 
response.Write("<script language=javascript>alert('网站名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if url=""  then 
response.Write("<script language=javascript>alert('网站地址不能为空!');history.go(-1)</script>") 
response.end 
end if
if px_id="" then 
response.Write("<script language=javascript>alert('排序ID不能为空!');history.go(-1)</script>") 
response.end 
end if
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs.addnew
rs("name")=name
rs("url")=url
rs("px_id")=px_id
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('增加链接成功！');window.location.href='admin_link.asp';</script>" 
end if
%>
<%
if request("act")="del" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from link where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('链接刪除成功！');window.location.href='admin_link.asp';</script>" 
end if
%>

