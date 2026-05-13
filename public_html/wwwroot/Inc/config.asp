<!--#include file="Function.asp" -->
<% 
set config=server.createobject("adodb.recordset") 
exec="select * from config" 
config.open exec,conn,1,1 
%>
<%
'######################################
' 蓝科外贸网站管理系统中英文双语版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>