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
<title>列表管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7">
    <div>
    <strong><a href="admin_news.asp">新闻管理</a></strong> 
    <span>
    <%
	dim rs,exec,rs2,exec2,ssfl
    set rs2=server.createobject("adodb.recordset")
	exec2="select * from news_fl order by id desc"
	rs2.open exec2,conn,1,1 
	if rs2.eof then
    response.Write "&nbsp;暂无分类！"
	end if
	do while not rs2.eof
    %>
    <a href="admin_news.asp?ssfl=<%=rs2("id")%>"><%=rs2("title")%></a> | 
    <%
	rs2.movenext 
    loop
	rs2.close
	set rs2=nothing
	%>
    </span>
    </div>
    </td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
<%
ssfl=Request.QueryString("ssfl")
set rs=server.createobject("adodb.recordset") 
if ssfl = "" then
exec="select * from news order by hits asc,id desc"
else
exec="select * from news where ssfl="&ssfl&" order by hits asc,id desc"
end if 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无新闻！"
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
<form method="POST" action="admin_news.asp?del=ok">
<%For i=1 To x%>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF">
        <tr bgcolor="#f4f4f4">
          <td width="48%" height="30">
          <input type="checkbox" name="classid" value="<%=rs("id")%>">
 · <a href="../News/<%=rs("id")%>.html" style="font-size:14px; color:#003399;"  target="_blank" title="<%=rs("title")%>"> <%=left(rs("title"),50)%></a></td>
          <td width="9%">&nbsp;&nbsp;排序号：<a href="xiugai_news.asp?id=<%=rs("id")%>" style=" color:#FF3300;"><%=rs("hits")%></a></td>
          <td width="9%"><input type="button" name="Submit" value="生成静态" onClick="window.location.href='news_html.asp?id=<%=rs("id")%>' " /></td>
          <td width="8%" height="30"><input type="button" name="Submit3" value="修改新闻" onClick="window.location.href='xiugai_news.asp?id=<%=rs("id")%>' "/> </td>
          <td width="26%" height="30"><input type="button" name="Submit" value="删除新闻" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_news.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
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
'批量删除
if Request.QueryString("del")="ok" then
if Request("classid")="" then
Response.Write "<script>alert('请选择要删除的新闻!');window.location.href='admin_news.asp';</script>" 
response.end()
end if

all = Request("classid")
delid = split(all,",")
for i=lbound(delid) to ubound(delid)
'Response.Write delid(i)
'删除静态文件
set fso = server.createobject("scripting.filesystemobject")
'先来判定这个静态文件是否存在
if fso.fileexists(server.mappath("../News/"&trim(delid(i))&".html")) then
fso.deletefile(server.mappath("../News/"&trim(delid(i))&".html"))
else
Response.Write "<script>alert('静态文件不存在！')</script>" 
end if
set fso = nothing
next

dim sql
sql="delete from news where id in ("&Request("classid")&")"
conn.Execute ( sql )
conn.close
set conn=nothing
Response.Write "<script>alert('批量删除新闻成功!');window.location.href='admin_news.asp';</script>" 
end if
%>

<%
'单条删除
if request("act")="del" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from news where id="&id
rs.open sql,conn,2,3

if rs.eof then
rs.close
set rs = nothing
Response.Write "<script>alert('你要删除的数据不存在！');window.location.href='admin_shop.asp';</script>" 
else
'删除静态文件
set fso = server.createobject("scripting.filesystemobject")
'先来判定这个静态文件是否存在
if fso.fileexists(server.mappath("../news/"&id&".html")) then
fso.deletefile(server.mappath("../news/"&id&".html"))
else
Response.Write "<script>alert('静态文件不存在！')</script>" 
end if

set fso = nothing

rs.delete
rs.update
Response.Write "<script>alert('新闻刪除成功！');window.location.href='admin_news.asp';</script>" 
end if
end if
%>
