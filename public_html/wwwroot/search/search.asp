<!--#include file="../Inc/utf-8.asp"-->
<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/conn.asp"-->
<!--#include file="../Inc/config.asp" -->
<!--#include file="../Inc/page.asp" -->
<!--#include file="../Inc/CSQL.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Product search-<%=config("title")%></title>
<meta name="keywords" content="<%=config("keywords")%>" />
<meta name="description" content="<%=config("description")%>" />
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="../js/jquery-1.4.3.min.js"></script>
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
        <div class="category_title">Your position：<a href="<%=root%>/index.html">Home</a> > Product search</div>
            <ul class="products_list">
			<%
            dim title
            title=trim(request.querystring("search1"))
            set rs=server.createobject("adodb.recordset") 
            exec="select * from shop where title like '%"&title&"%'" 
            rs.open exec,conn,1,1 
            if title="" then
            response.write ("<script language=""javascript"">alert(""Please enter keywords!"");history.go(-1);</script>")
            end if
            if rs.eof then
            response.Write "&nbsp;Sorry, no content related to the search!"
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
            <%For i=1 To x%>
                <li>
                    <a href="<%=root%>/products/<%=rs("id")%>.html" title="<%=CSQL(rs("title"))%>"><img name='picautozoom' class="img_border" src='<%=root%><%=rs("img")%>' width='155' height='125' /></a>
                    <p><a href="<%=root%>/products/<%=rs("id")%>.html" title="<%=CSQL(rs("title"))%>"><%=left(rs("title"),50)%></a></p>
                </li>
		   <%
           rs.movenext
           next
           end if
           %>
            </ul>
            
            <div class="page">
                <%'以下显示分页
                call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
                rs.close
                set rs=nothing
                %>   
            </div>
        
    </div>
    <!-- end of right -->
    
</div>
<!-- end of center -->

</div>
<!-- end of main -->

<!--#include file="../Inc/foot.asp" -->
<script type="text/javascript" language="javascript" src="../js/picAutoZoom.js"></script>
<script type="text/javascript" language="javascript">
<!--
    $.ajaxSetup({
        timeout: 300000
    });
//-->
</script>
</body>
</html>