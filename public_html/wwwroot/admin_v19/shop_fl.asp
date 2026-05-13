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
<title>产品分类管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>产品分类管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
<%
dim rs,exec,did	
set rs=server.createobject("adodb.recordset") 
exec="select * from shop_fl where sid = 0 order by px_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无分类！"
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
<%
For i=1 To x
did = rs("id")
%>
<form  name="add" method="post" action="shop_fl.asp?xiugaipx=ok">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr bgcolor="#efefef">
          <td width="26%" height="35"><input name="id" type="hidden" id="id" value="<%=rs("id")%>" />
            <label>
            <b>大类名称：</b>
            <input name="title" type="text" value="<%=rs("title")%>">
            </label></td>
          <td width="11%" height="35">排序： 
            <input name="px_id" type="text" value="<%=rs("px_id")%>" size="2"></td>
            
            <td width="10%" height="35"><label>
            <input onClick="location='shop_flx.asp?sid=<%=rs("id")%>'" type="button" name="Submit" value="管理小类">
          </label></td>
          <td width="10%" height="35"><label>
            <input type="submit" name="button" id="button" value="修改分类">
          </label></td>
          <td width="43%" height="35"><input type="button" name="Submit" value="删除分类" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='shop_fl.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /></td>
          </tr>

       <%
	  '产品小类开始
	  dim rsx,execx
	  set rsx=server.createobject("adodb.recordset") 
      execx="select * from shop_fl where sid = "&did&" order by px_id asc" 
      rsx.open execx,conn,1,1
	  do while not rsx.eof 
	  %>
        <tr valign="middle">
          <td width="26%" height="28" bgcolor="#FFFFFF">
            <label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└小类：
            <input type="text" value="<%=rsx("title")%>">
            </label></td>
          <td width="11%" height="28" bgcolor="#FFFFFF">&nbsp;</td>
          <td width="10%" height="28" bgcolor="#FFFFFF">&nbsp;</td>
          <td width="10%" height="28" bgcolor="#FFFFFF">&nbsp;</td>
          <td width="43%" height="28" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
     <% 
     rsx.movenext 
     loop
	 '产品小类结束 
     %>
      </table>
      </form>
<%
rs.movenext
next
%>
<%
end if
%>

</td>
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
    <td bgcolor="#F7F7F7"><font color="#FF0000"><strong>增加大类</strong></font></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><form name="form1" method="post" action="shop_fl.asp?xiugaifl=ok">
      中文名称：
        <input name="title" type="text"> 
      排序：
      <input name="px_id" type="text" size="2"> 
        <input type="submit" name="button2" id="button2" value="增加大类">
        <font color="#FF0000">（数字越小越靠前。）</font>
    </form>
      </td>
  </tr>
</table>
</body>
</html>
<%
'修改分类 
if Request.QueryString("xiugaipx")="ok" then
id=request("id") 
sql="select * from shop_fl where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("title")=request.form("title") 
rs("px_id")=request.form("px_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""修改分类成功！"");window.location.href='shop_fl.asp';</script>")
end if
%> 

<%
'新增分类
if Request.QueryString("xiugaifl")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select title,px_id from shop_fl"
rs.open sql,conn,1,3
title=request.form("title")
px_id=request.form("px_id")
if title=""  then 
response.Write("<script language=javascript>alert('中文名称不能为空!');history.go(-1)</script>") 
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
rs("px_id")=px_id
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('分类增加成功！');window.location.href='shop_fl.asp';</script>" 
end if
%>

<%
'删除分类
if request("act")="del" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from shop_fl where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('分类刪除成功！');window.location.href='shop_fl.asp';</script>" 
end if
%>
