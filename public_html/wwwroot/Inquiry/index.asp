<!--#include file="../Inc/utf-8.asp"-->
<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/conn.asp"-->
<!--#include file="../Inc/config.asp" -->
<%
dim id,rs,exec,title
id = request.querystring("id")
if id <> "" then

if not isnumeric(id) then
response.write "<script>alert('非法操作');history.back();</script>"
response.end
end if
 
exec="select * from shop where id="&id
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1
if rs.eof then
rs.close
set rs = nothing
conn.close
set conn = nothing
response.write "<script>alert('不存在此数据');history.back();</script>"
response.end
else
title = rs("title")
end if 

else
title = ""
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Inquiry-<%=config("title")%></title>
<meta name="keywords" content="<%=config("keywords")%>" />
<meta name="description" content="<%=config("description")%>" />
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<!--[if lte IE 6]>
<script src="../js/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div,img');
    </script>
<![endif]--> 
</head>
<body>
<div id="main">

<div id="translate">
    <!-- Begin TranslateThis Button -->
    <div id="translate-this"><a style="width:180px;height:18px;display:block;" class="translate-this-button" href="http://www.translatecompany.com/"></a></div>
    <script type="text/javascript" src="http://x.translateth.is/translate-this.js"></script>
    <script type="text/javascript">
    TranslateThis();
    </script>
    <!-- End TranslateThis Button -->
</div>

<!--#include file="../Inc/header.asp" -->

<div id="center">

<!--#include file="../Inc/left.asp"-->
    
    <div id="right">   
        <div class="category_title">Your position：<a href="<%=root%>/index.html">Home</a> > Inquiry</div>
            <form id="form1" name="form1" method="post" action="dg_ok.asp">
            <dl class="table">
                <dt>Product Name：</dt>
                <dd><input name="title" type="text" value="<%=title%>" size="40"/></dd>
                <dt>Order quantity：</dt>
                <dd><input name="sl" type="text" size="40"/></dd>
                <dt>Your Name：</dt>
                <dd><input name="name" type="text" size="40"/></dd>
                <dt>Tel：</dt>
                <dd><input name="tel" type="text" size="40"/></dd>
                <dt>E-mail：</dt>
                <dd><input name="mail" type="text" size="40"/></dd>
                <dt>Content：</dt>
                <dd class="biezhu"><textarea name="bz" cols="50" rows="8"></textarea></dd>
                <dt>Code：</dt>
                <dd><input name="VerifyCode" class="box" style="width:50px;">&nbsp;<img id="vcodeImg" src="about:blank" onerror="this.onerror=null;this.src='../Inc/VerifyCode.asp?s='+Math.random();" alt="Verification code" title="Can't see clearly?click" style="margin-right:8px;cursor:pointer;" onClick="src='../Inc/VerifyCode.asp?s='+Math.random()"/></dd>
                <dt> </dt>
                <dd><input type="submit" name="button" id="button" value="Submit orders" /></dd>
            </dl>
            </form>
        
    </div>
    <!-- end of right -->
    
</div>
<!-- end of center -->

</div>
<!-- end of main -->

<!--#include file="../Inc/foot.asp" -->
</body>
</html>