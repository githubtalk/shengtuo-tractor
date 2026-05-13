<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!-- #include file="../Inc/webset.asp" -->
<%
'######################################
' 蓝科外贸网站管理系统中英文双语版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>
<%
dim product_num,product_width,product_height,plist_num,news_num,nlist_num,hot_num
if Request.QueryString("action")="ok" then
	root=Request.Form("root")
	product_num=Request.Form("product_num")
	product_width=Request.Form("product_width")
	product_height=Request.Form("product_height")
	plist_num=Request.Form("plist_num")
	news_num=Request.Form("news_num")
	nlist_num=Request.Form("nlist_num")
	hot_num=Request.Form("hot_num")
	tomail=Request.Form("tomail")
	
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	path = Server.MapPath("../Inc/webset.asp")
	set file = fso.OpenTextFile(path,2,TRUE)

	file.write(chr(60)&chr(37)) & vbcrlf
	file.write("root="""&root&"""") & vbcrlf
	file.write("product_num="""&product_num&"""") & vbcrlf
	file.write("plist_num="""&plist_num&"""") & vbcrlf
	file.write("news_num="""&news_num&"""") & vbcrlf
	file.write("nlist_num="""&nlist_num&"""") & vbcrlf
	file.write("hot_num="""&hot_num&"""") & vbcrlf
	file.write("tomail="""&tomail&"""") & vbcrlf
	file.write(chr(37)&chr(62)) & vbcrlf  
	
	file.close
	
	set file = nothing
	set fso = nothing
	Response.Write("<script>alert('更新成功!');</script>")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站属性设置</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#F7F7F7"><div align="left"><strong><a href="xiugai_webset.asp">网站属性设置</a> | <a href="xiugai_email.asp"  style="color:#FF0000">发信箱设置</a></strong></div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="8" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
      <form name="form1" method="post" action="?action=ok">    
        <tr>
          <td>网站系统目录：</td>
          <td><input name="root" type="text" value="<%=root%>" size="20" /> 
            <font color="#FF0000">*在根目录运行请留空，二级目录运行可设置如：/Lankecms </font></td>
        </tr>
        <tr bgcolor="#F7F7F7">
          <td width="15%">首页产品个数：</td>
          <td width="85%">
          <input name="product_num" type="text" value="<%=product_num%>" size="20" /> <font color="#FF0000">*填数字 </font></td>
        </tr>
      
        <tr>
          <td>产品列表页的产品个数：</td>
          <td><input name="plist_num" type="text" value="<%=plist_num%>" size="20" /> <font color="#FF0000">*填数字 </font></td>
        </tr>
        
         <tr bgcolor="#F7F7F7">
          <td width="15%">新闻中心的新闻条数：</td>
          <td width="85%">
          <input name="news_num" type="text" value="<%=news_num%>" size="20" /> <font color="#FF0000">*填数字 </font></td>
        </tr>
      
        <tr>
          <td>新闻列表页的新闻条数：</td>
          <td><input name="nlist_num" type="text" value="<%=nlist_num%>" size="20" /> <font color="#FF0000">*填数字 </font></td>
        </tr>
        
         <tr bgcolor="#F7F7F7">
          <td width="15%">左侧推荐产品个数：</td>
          <td width="85%">
          <input name="hot_num" type="text" value="<%=hot_num%>" size="20" /> <font color="#FF0000">*无须填写</font></td>
        </tr>
         <tr>
          <td>接收订单的邮箱：</td>
          <td><input name="tomail" type="text" value="<%=tomail%>" size="20" /> <font color="#FF0000">*留空则订单不发邮件</font></td>
        </tr>
        
          <td colspan="2"><input type="submit" name="button" value="确认修改" /></td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
</body>
</html>
