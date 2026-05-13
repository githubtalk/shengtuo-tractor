<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<%
'######################################
' 蓝科外贸网站管理系统英文版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>
<% 
exec="select * from job where id="& request.QueryString("id") 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
<html>
<head>
<title>发布职位</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="images/style.css" rel=stylesheet type=text/css>
</head>
<body>
<form name="form1" method="post" action="updata_zw.asp">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div style="padding:10px; font-weight:bold;">发布招聘职位</div></td>
  </tr>
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="6" cellspacing="1" bgcolor="#FFFFFF">
      
      <tr>
        <td width="14%" bgcolor="#FFFFFF">职位名称</td>
        <td bgcolor="#FFFFFF"><input name="zw_name" type="text" value="<%=rs("zw_name")%>" />
            <font color="#FF0000">(英文) </font><input name="id" type="hidden" id="id" value="<%=request.querystring("id")%>" /></td>
        <td bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">性别</td>
        <td width="35%" bgcolor="#F7F7F7">
 <input type="radio" name="sex" value="1" <%if rs("sex")=1 then%>checked<%end if%>>男　 
<input type="radio" name="sex" value="2" <%if rs("sex")=2 then%>checked<%end if%>>女　 
<input type="radio" name="sex" value="0" <%if rs("sex")=0 then%>checked<%end if%>>
保密 <font color="#FF0000">(英文)</font></td>
        <td width="51%" bgcolor="#F7F7F7">&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF">年龄</td>
        <td colspan="2" bgcolor="#FFFFFF"><input name="nn1" type="text"  value="<%=rs("nn1")%>" size="5" />
          至
          <input name="nn2" type="text" value="<%=rs("nn2")%>" size="5" />
          岁</td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">文化程度</td>
        <td bgcolor="#F7F7F7"><label>
          <select name="xueli" id="select">
            <option>More than junior high school</option>
            <option>High school / secondary</option>
            <option>College</option>
            <option>College-level or higher</option>
            <option>Master / Dr / Graduate</option>
          </select>
          <font color="#FF0000">(英文)</font></label></td>
        <td bgcolor="#F7F7F7">&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF">招聘人数</td>
        <td colspan="2" bgcolor="#FFFFFF"><input name="renshu" type="text" value="<%=rs("renshu")%>"  size="10" />
          人</td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">其它要求</td>
        <td colspan="2" bgcolor="#F7F7F7"><textarea name="yaoqiu" cols="60" rows="8"><%=rs("yaoqiu")%></textarea>
            <font color="#FF0000">(英文)</font></td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">&nbsp;</td>
        <td colspan="2" bgcolor="#F7F7F7"><input type="submit" name="button" id="button" value="修改职位" /></td>
      </tr>
    </table></td>
  </tr>
</table></form>
</body>
</html>
