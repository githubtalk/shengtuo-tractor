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
<title>网站菜单管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>网站菜单管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
<%
dim rs,exec,target
set rs=server.createobject("adodb.recordset") 
exec="select * from menu order by px_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无菜单！"
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
<%
For i=1 To x
target = rs("target")
%>
<form  name="add" method="post" action="admin_menu.asp?xiugaipx=ok">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr bgcolor="#F7F7F7">
          <td width="41%"><input name="id" type="hidden" id="id" value="<%=rs("id")%>" />
            菜单名称：
            <input name="title" type="text" value="<%=rs("title")%>" size="12"> 
            链接地址：<input name="url" type="text" value="<%=rs("url")%>" size="22">
</td>
          <td width="8%"><select name="show">
<option value="1" <%if rs("show")=1 then%>selected="selected"<%end if%>>显示</option>
 <option value="0" <%if rs("show")=0 then%>selected="selected"<%end if%>>隐藏</option>
 </select></td>
          <td width="8%">
            <select name="target" id="select">
              <option value="_self" <%if target = "_self" then response.Write "selected" end if%>>原窗口</option>
              <option value="_blank"  <%if target = "_blank" then response.Write "selected" end if%>>新窗口</option>
            </select>
          </td>
          <td width="10%">排序：
            <input name="px_id" type="text" value="<%=rs("px_id")%>" size="1"></td>
          <td width="6%">
            <input type="submit" name="button" id="button" value="修改">
          </td>
          <td width="35%"><input type="button" name="Submit" value="删除" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_menu.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
        </tr>
      </table>
</form>
      <%rs.movenext
next
%>
    <%
end if
%></td>
  </tr>
</table>
<br>

<table width="95%" border="0" align="center" cellpadding="8" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#F7F7F7"><strong>增加菜单 <font color="#FF0000">（排序数字越小越靠前。） </font></strong></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><form name="form1" method="post" action="admin_menu.asp?xiugaifl=ok">
      菜单名称：
          <input name="title" type="text" size="8">
       链接地址：   
       <input name="url" type="text" size="18">  
        打开方式：
       <select name="target" id="target">
        <option value="_self">原窗口</option>
        <option value="_blank">新窗口</option>
      </select>
       菜单显示：
      <select name="show" id="show">
          <option value="1">显示</option>
          <option value="0">隐藏</option>
        </select>  
      排序：
      <input name="px_id" type="text" size="1"> 
        <input type="submit" name="button2" id="button2" value="增加">
    </form>
      </td>
  </tr>
</table>
</body>
</html>
<%
'修改菜单 
if Request.QueryString("xiugaipx")="ok" then
id=request.form("id") 
sql="select * from menu where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("title")=request.form("title") 
rs("url")=request.form("url") 
rs("target")=request.form("target")
rs("show")=request.form("show")
rs("px_id")=request.form("px_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""修改菜单成功！"");window.location.href='admin_menu.asp';</script>")
end if
%> 

<%
'新增菜单
if Request.QueryString("xiugaifl")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select title,url,target,show,px_id from menu"
rs.open sql,conn,1,3
title=request.form("title")
url=request.form("url")
target=request.form("target")
px_id=request.form("px_id")
show=request.form("show")
if title=""  then 
response.Write("<script language=javascript>alert('中文菜单名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if url=""  then 
response.Write("<script language=javascript>alert('中文链接地址不能为空!');history.go(-1)</script>") 
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
rs("title")=title
rs("url")=url
rs("target")=target
rs("px_id")=px_id
rs("show")=show
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('菜单增加成功！');window.location.href='admin_menu.asp';</script>" 
end if
%>

<%
'删除菜单
if request("act")="del" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from menu where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('刪除菜单成功！');window.location.href='admin_menu.asp';</script>" 
end if
%>