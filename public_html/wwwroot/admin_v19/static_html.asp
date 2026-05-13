<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
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
    <td height="30" bgcolor="#F7F7F7"><div><strong>生成静态</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td height="50" valign="middle" bgcolor="#FFFFFF">
<p>
<%
dim id
id = request.querystring("id")
if id = "" or not isnumeric(id) then
response.write "<script>alert('非法操作');history.back();</script>"
response.end
end if
%>
<form method="post">
<%
Select case id 
case 1
%>
<input type="button" name="Submit" value="开始生成首页" onClick="window.location.href='index_html.asp' "/>
<%case 2 %>
<input type="button" name="Submit" value="开始生成产品" onClick="window.location.href='showshop_html_all.asp' "/>
<%case 3 %>
<input type="button" name="Submit" value="开始生成新闻" onClick="window.location.href='news_html_all.asp' "/>
<%case 4 %>
<input type="button" name="Submit" value="开始生成案例" onClick="window.location.href='cases_html_all.asp' "/>
<%case 5 %>
<input type="button" name="Submit" value="开始生成单页" onClick="window.location.href='about_html_all.asp' "/>
<%case 6 %>
<input type="button" name="Submit" value="开始生成下载" onClick="window.location.href='download_html_all.asp' "/>
<%case 7 %>
<input type="button" name="Submit" value="开始生成SiteMap" onClick="window.location.href='SiteMap.asp' "/>
<%case 8 %>
<input type="button" name="Submit" value="开始生成网站地图" onClick="window.location.href='tidu_html.asp' "/>
<%End Select%>
</form>
</p>
</td>
  </tr>
</table>

</body>
</html>