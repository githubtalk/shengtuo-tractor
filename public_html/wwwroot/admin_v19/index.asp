<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->
<html>
<head>
<title><%=config("title")%></title>
<link href="images/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {background-color: #044668;}
-->
</style>
</head>
<body>
<form  name="add" method="post" action="adminpass.asp">
<div style="padding-top:150px;">
  <table width="641" border="0" align="center">
  <tr>
    <td width="641" height="232" align="right" valign="middle" background="images/bg.jpg"><table width="355" border="0">
      <tr>
        <td width="220"><table width="100%" border="0">
          <tr>
            <td width="20%">账 号</td>
            <td width="80%"><input name="admin" type="text" size="22"></td>
          </tr>
          <tr>
            <td>密 码</td>
            <td><input name="password" type="password" size="24"></td>
          </tr>
          <tr>
            <td>验证码</td>
            <td align="left" valign="middle"><input name="VerifyCode" type="text"  id="VerifyCode" size="10" maxlength="5"/>
            <img src="vCode.asp?" onClick="this.src+=Math.random()" alt="图片看不清？点击重新得到验证码" style="cursor:hand;" /> </td>
          </tr>
        </table></td>
        <td width="115"><input border=0 cache height=89 src="images/login.jpg" type=image width=82 name="image"></td>
      </tr>
    </table></td>
  </tr>
</table>
</div>
</form>
<table width="100%" border="0">
  <tr>
    <td align="center" valign="middle"><a href="<%=config("url")%>" target="_blank" style="color:#CCCCCC"><%=config("title")%></a></td>
  </tr>
</table>

</body>
</html>