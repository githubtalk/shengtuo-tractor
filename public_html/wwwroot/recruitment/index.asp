<!--#include file="../Inc/utf-8.asp"-->
<!--#include file="../Inc/conn.asp"-->
<!--#include file="../Inc/config.asp" -->
<!--#include file="../Inc/page.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Recruitment-<%=config("title")%></title>
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
        <div class="category_title">Your position：<a href="<%=root%>/index.html">Home</a> > Recruitment</div>
<table width="720" border="0" cellpadding="0" cellspacing="2">    
      <tr>
        <td width="100%" colspan="2">
		<%	
		set rs=server.createobject("adodb.recordset") 
		exec="select * from job order by id desc  " 
		rs.open exec,conn,1,1 
		if rs.eof then
		response.Write "&nbsp;暂无职位！"
		else
		rs.PageSize =3 '每页记录条数
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
          <%For i=1 To x%>
          <div style="margin-left:10px;">
            <table width="99%" border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#CCCCCC">
              <tr>
                <td width="16%" bgcolor="#F7F7F7"><div align="center">Job:</div></td>
                <td width="29%" bgcolor="#FFFFFF"><%=rs("zw_name")%></td>
                <td width="13%" bgcolor="#F7F7F7"><div align="center">Age:</div></td>
                <td width="21%" bgcolor="#FFFFFF"><%=rs("nn1")%> - <%=rs("nn2")%></td>
                <td width="9%" bgcolor="#F7F7F7"><div align="center">sex:</div></td>
                <td width="12%" bgcolor="#FFFFFF">
                  <div align="center">
                   <%
					if rs("sex")=1 then 
					response.write "Man" 
					elseif rs("sex")=2 then
					response.write "Woman" 
					else 
					response.write("No")
					end if
					%>
                  </div></td>
              </tr>
              <tr>
                <td bgcolor="#F7F7F7"><div align="center">Education：</div></td>
                <td bgcolor="#FFFFFF"><%=rs("xueli")%></td>
                <td bgcolor="#F7F7F7"><div align="center">Number：</div></td>
                <td colspan="3" bgcolor="#FFFFFF"><%=rs("renshu")%></td>
                </tr>
              <tr>
                <td bgcolor="#F7F7F7"><div align="center">Requirements：</div></td>
                <td colspan="4" bgcolor="#FFFFFF"><%=rs("yaoqiu")%></td>
                <td bgcolor="#FFFFFF"><div align="center"><a href="mail_job.asp" style="color:#990000">Apply for</a></div></td>
              </tr>
            </table>
          </div>
          <br>
          <%rs.movenext
			next
			end if
			%>
            </td>
          </tr>
          <tr>
            <td colspan="2">
            <%'以下显示分页
            call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
            rs.close
            set rs=nothing
            %>
            </td>
          </tr>
        </table>
        
    </div>
    <!-- end of right -->
    
</div>
<!-- end of center -->

</div>
<!-- end of main -->

<!--#include file="../Inc/foot.asp" -->
</body>
</html>