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
<title>产品管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7">
       <div>
    <strong><a href="admin_shop.asp">产品管理</a></strong> 
    <span>
    <%
	dim rs,exec,rs2,exec2,ssfl
    set rs2=server.createobject("adodb.recordset")
	exec2="select * from shop_fl where sid = 0 order by px_id asc"
	rs2.open exec2,conn,1,1 
	if rs2.eof then
    response.Write "&nbsp;暂无分类！"
	end if
	do while not rs2.eof
    %>
    <a href="admin_shop.asp?ssfl=<%=rs2("id")%>" title="<%=rs2("etitle")%>"><%=rs2("title")%></a>
    <%
	rs2.movenext 
    loop
	rs2.close
	set rs2=nothing
	%>
    </span>    </div>    </td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
<%
dim title
title=trim(request.querystring("search1"))
if title="" then
response.write ("<script language=""javascript"">alert(""请输入搜索关键字!"");history.go(-1);</script>")
end if	
set rs=server.createobject("adodb.recordset") 
exec="select * from shop where title like '%"&title&"%'" 
rs.open exec,conn,1,1 

if rs.eof then
response.Write "&nbsp;对不起，没有您要搜索的产品!"
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
<form method="POST" action="admin_shop.asp?del=ok">
<%
For i=1 To x
homeshow = rs("homeshow")
%>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#FFFFFF">
        <tr bgcolor="#f4f4f4">
          <td width="9%" valign="middle">
          <input type="checkbox" name="classid" value="<%=rs("id")%>" style="margin-bottom:10px;">
          <a href="../<%=rs("img")%>" target="_blank"><img src="../<%=rs("img")%>" width="50" height="50"></a>          </td>
          <td width="46%"><a href="../products/<%=rs("id")%>.html" style="font-size:14px; color:#003399;" target="_blank"><%=left(rs("title"),30)%></a></td>
          <td width="11%">
          <%
          if homeshow = 1 then
		  %>
          &nbsp;<a href="xiugai_shop.asp?id=<%=rs("id")%>"><img src="images/home.gif" alt="首页显示" width="10" height="10" border="0"></a>
          <%else%>
          &nbsp;<a href="xiugai_shop.asp?id=<%=rs("id")%>"><img src="images/home2.gif" alt="首页不显示" width="10" height="10" border="0"></a>
          <%
          end if
		  %>
          &nbsp;&nbsp;序号：<a href="xiugai_shop.asp?id=<%=rs("id")%>" style=" color:#FF3300;"><%=rs("px_id")%></a>          </td>
          <td width="10%"><input type="button" name="Submit" value="生成静态" onClick="window.location.href='showshop_html.asp?id=<%=rs("id")%>' " /></td>
          <td width="10%"><input type="button" name="Submit3" value="修改产品" onClick="window.location.href='xiugai_shop.asp?id=<%=rs("id")%>' "/> </td>
          <td width="14%"><input type="button" name="Submit" value="删除产品" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_shop.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
        </tr>
      </table>
      <%rs.movenext
        next
      %>
      <%
      end if
      %>
      <br/>
      <input type="submit" value="删除选中" name="B1">
      </form>
      
        <span style="float:right; padding-top:4px;">
        <form id="search" name="search" method="post" action="admin_search.asp">
        <strong style="color:#7c7b7b; font-size:13px;">搜 索:</strong>
        <input type="text" name="search1" onFocus="this.value=''" />
        <input type="submit" value="产品搜索">
        </form>
         </span>
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
</body>
</html>
<% 
if Request.QueryString("xiugaipx")="ok" then
id=request("id") 
sql="select * from shop where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if 
rs("px_id")=request.form("px_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""修改排序成功！"");window.location.href='admin_shop.asp';</script>")
end if
%> 

<%
if Request.QueryString("del")="ok" then
if Request("classid")="" then
Response.Write "<script>alert('请选择要删除的产品!');window.location.href='admin_shop.asp';</script>" 
response.end()
end if
dim sql
sql="delete from shop where id in ("&Request("classid")&")"
conn.Execute ( sql )
conn.close
set conn=nothing
Response.Write "<script>alert('批量删除产品成功!');window.location.href='admin_shop.asp';</script>" 
end if
%>

<%
if request("act")="del" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from shop where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('产品刪除成功！');window.location.href='admin_shop.asp';</script>" 
end if
%>
