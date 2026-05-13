<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<!--#include file="md5.asp" -->
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
<title>后台用户管理中心</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>后台用户管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
<%	
set rs=server.createobject("adodb.recordset") 
exec="select * from admin order by id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无管理员，请添加！"
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
<form  name="add" method="post" action="admin_manage.asp?xiugaipx=ok">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF">
        <tr bgcolor="#F7F7F7">
          <td width="22%" height="30"><input name="id" type="hidden" id="id" value="<%=rs("id")%>" />
            <label>
            用户名：
            <input name="admin" type="text" value="<%=rs("admin")%>">
            </label></td>
          <td width="31%" height="30">密 码：
            <input name="password" type="text" size="30"></td>
          <td width="13%" height="30"><label>
            <input type="submit" name="button" id="button" value="修改密码">
          </label></td>
          <td width="34%" height="30"><input type="button" name="Submit" value="删除用户" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_manage.asp?act=del&id=<%=rs("id")%>&admin=<%=rs("admin")%>';}else{history.go(0);}" /> </td>
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
    <td bgcolor="#F7F7F7"><strong>添加管理员</strong></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><form name="form1" method="post" action="admin_manage.asp?xiugaifl=ok">
      用户名：
        <input name="admin" type="text">
      &nbsp;密 码：
      <input name="password" type="text" size="28"> 
        <input type="submit" name="button2" id="button2" value="添加用户">
        <font color="#FF0000">（数字越小越靠前。）</font>
    </form>
      </td>
  </tr>
</table>
</body>
</html>
<%
'修改密码
dim admin,password
if Request.QueryString("xiugaipx")="ok" then
id=request("id") 
admin=request.form("admin")
password=request.form("password")
if password=""  then 
response.Write("<script language=javascript>alert('密码不能为空，请输入密码!');history.go(-1)</script>") 
response.end 
end if

sql="select * from admin where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("admin")= admin
rs("password")= md5(password)
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert('修改成功!您的密码是："&password&"');window.location.href='admin_manage.asp';</script>")
end if
%> 

<%
'添加用户
if Request.QueryString("xiugaifl")="ok" then
admin=request.form("admin")
password=request.form("password")

sqlReg="select * from [admin] where admin='" & admin & "'"
set rsReg=server.createobject("adodb.recordset")
rsReg.open sqlReg,conn,1,3
if not(rsReg.bof and rsReg.eof) then
response.write "<script>alert('已有此用户!"&admin&"');history.back();</script>"
response.end
end if

set rs=server.createobject("adodb.recordset")
sql="select * from admin"
rs.open sql,conn,1,3
if admin=""  then 
response.Write("<script language=javascript>alert('用户名不能为空!');history.go(-1)</script>") 
response.end 
end if
if password=""  then 
response.Write("<script language=javascript>alert('密码不能为空!');history.go(-1)</script>") 
response.end 
end if

rs.addnew
rs("admin")=admin
rs("password")= md5(password)
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('管理员添加成功！');window.location.href='admin_manage.asp';</script>" 
end if
%>

<%
'删除用户
if request("act")="del" then
id=Request.QueryString("id")
admin=Request.QueryString("admin")
set rs=server.createobject("adodb.recordset")
sql="select * from admin where id="&id

if admin = session("admin") then 
response.Write("<script language=javascript>alert('不能删除自己的帐号!');history.go(-1)</script>") 
response.end 
end if

rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('用户刪除成功！');window.location.href='admin_manage.asp';</script>" 
end if
%>
