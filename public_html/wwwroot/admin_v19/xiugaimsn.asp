<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!-- #include file="../Inc/evars.asp" -->
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
if Request.QueryString("action")="ok" then
    c_isqq=Request.Form("c_isqq")
	msn_num=Request.Form("msn_num")
	msn_name=Request.Form("msn_name")
	tt_skype=Request.Form("tt_skype")
	qq_num=Request.Form("qq_num")
	qq_name=Request.Form("qq_name")
	wang_num=Request.Form("wang_num")
	alibaba_num=Request.Form("alibaba_num")
	
set stm=server.createobject("adodb.stream")  
    stm.type=2  
    stm.mode=3  
    stm.Charset = "utf-8"   
    stm.open  
    stm.writetext(chr(60)&chr(37)) & vbcrlf
	stm.writetext("c_isqq="""&c_isqq&"""") & vbcrlf
	stm.writetext("msn_num="""&msn_num&"""") & vbcrlf
	stm.writetext("msn_name="""&msn_name&"""") & vbcrlf
	stm.writetext("tt_skype="""&tt_skype&"""") & vbcrlf
	stm.writetext("qq_num="""&qq_num&"""") & vbcrlf
	stm.writetext("qq_name="""&qq_name&"""") & vbcrlf
	stm.writetext("wang_num="""&wang_num&"""") & vbcrlf
	stm.writetext("alibaba_num="""&alibaba_num&"""") & vbcrlf
	stm.writetext(chr(37)&chr(62)) & vbcrlf
    stm.savetofile server.mappath("../Inc/evars.asp"),2   
    stm.flush  
    stm.close  
set stm=nothing 
	Response.Write("<script>alert('更新成功!');</script>")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#F7F7F7"><div align="left"><strong>在线客服设置</strong><span class="text2"></span>，不需要的可留空。</div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="8" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
      <form name="form1" method="post" action="?action=ok">
        
        <tr bgcolor="#F7F7F7">
          <td width="12%">显示开关：</td>
          <td width="88%">
          <input type="radio" name="c_isqq" value="1" <%if c_isqq="1" then Response.Write("checked")%>>开
          <input type="radio" name="c_isqq" value="0" <%if c_isqq="0" then Response.Write("checked")%>>关
          </td>
        </tr>
        
        <tr>
          <td><span style="color:#0000FF;">MSN号码列表：</span></td>
          <td><input name="msn_num" type="text" value="<%=msn_num%>" size="50" /> 
          <span style="color:#0000FF;">*多个MSN号码之间用半角逗号&quot;,&quot;隔开,不要出现多余逗号,例如：10000,10001,10002</span></td>
        </tr>
        
        <tr>
          <td><span style="color:#0000FF;">MSN名称：</span></td>
          <td><input name="msn_name" type="text" value="<%=msn_name%>" size="50" /> 
          <span style="color:#0000FF;"><b>*注意：MSN名称个数必须与MSN号码个数相等！</b></span></td>
        </tr>
        
        <tr>
          <td>Skype帐号：</td>
          <td><input name="tt_skype" type="text" value="<%=tt_skype%>" size="50" /> 
          *多个Skype帐号之间用半角逗号&quot;,&quot;隔开</td>
        </tr>
        <tr>
          <td><span style="color:#FF0000;">QQ号码列表：</span></td>
          <td><input name="qq_num" type="text" value="<%=qq_num%>" size="50" /> 
          <span style="color:#FF0000;">*多个QQ号码之间用半角逗号&quot;,&quot;隔开</span></td>
        </tr>
        <tr>
          <td><span style="color:#FF0000;">QQ显示名称：</span></td>
          <td><input name="qq_name" type="text" value="<%=qq_name%>" size="50" /> 
          <span style="color:#FF0000;"><b>*注意：QQ名称个数必须与QQ号码个数相等！</b></span></td>
        </tr>
        <tr>
          <td><span style=" color:#006600">阿里旺旺账号：</span></td>
          <td><input name="wang_num" type="text" value="<%=wang_num%>" size="50" />
<span style=" color:#006600">*多个账号之间用半角逗号&quot;,&quot;隔开</span></td>
        </tr>
                <tr>
          <td><span style=" color:#006600">贸易通账号：</span></td>
          <td><input name="alibaba_num" type="text" value="<%=alibaba_num%>" size="50" />
<span style=" color:#006600">*多个账号之间用半角逗号&quot;,&quot;隔开</span></td>
        </tr>
          <td colspan="2" bgcolor="#F7F7F7"><input type="submit" name="button" value="确认修改" />
          </td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
</body>
</html>