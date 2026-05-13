<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<!--#include file="seeion.asp"--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>main</title>
<style>
body{
	background:url(../images/head.gif) no-repeat;
	font-size:12px;
	margin:0;
	padding:0;
	background-image: url();
}
a {
	font-size: 12px;
	color: #990000;
}
a:link {
	text-decoration: none;
	color: #FF0000;
}
a:visited {
	text-decoration: none;
	color: #FF0000;
}
a:hover {
	text-decoration: underline;
	color: #990000;
}
a:active {
	text-decoration: none;
	color: #990000;
}
</style>
</head>
<body>
<div style="padding:10px 0px 10px 35px; background-color:#F7F7F7;"> <font color="#FF0000" ><b><%=session("admin")%> </b></font>欢迎您！  <a href="/index.asp" target="_blank"></a><a href="Manage_backup.asp" target="main">备份数据库</a>  | <a href="xiugaipassword.asp" target="main">修改管理员密码</a> | <a href="../index.html" target="_blank">预览网站首页</a>   | <a href="http://www.lankecms.com/updata/index.asp" target="main">升级服务</a>   | <a href="LoginOut.asp?zx=ok" target="_parent">退出系统</a></div>
</body>
</html>
