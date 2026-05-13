<!--#include file="../Inc/webset.asp"-->
<!--#include file="config.asp" -->
<!--#include file="nav.asp" -->
<!--#include file="home_url.asp" -->

<%
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
end if 

ssfl = rs("ssfl")

set rstt=server.createobject("adodb.recordset") 
exectt="select * from shop_fl where id="&ssfl
rstt.open exectt,conn,1,1
tt = rstt("id")
tt2 = rstt("sid")

'产品信息
Lankecms_title = rs("title")
Lankecms_keyword = rs("keyword")
Lankecms_description = rs("description2")
Lankecms_img = rs("img")
Lankecms_protitle = rs("title")
Lankecms_ProductNo = rs("ProductNo")
Lankecms_price = rs("price")
Lankecms_description2 = left(rs("description2"),140)
id = rs("id")
a1=id
Lankecms_body = rs("body")

Lankecms_etitle = rs("etitle")
Lankecms_ekeyword = rs("ekeyword")
Lankecms_edescription = rs("edescription2")
Lankecms_eprotitle = rs("etitle")
Lankecms_eprice = rs("eprice")
Lankecms_edescription2 = rs("edescription2")
Lankecms_ebody = rs("ebody")
%>
<!--#include file="shop_point.asp" -->
<!--#include file="left.asp" -->
<!--#include file="adv.asp" -->
<!--#include file="hot.asp" -->
<!--#include file="flink.asp" -->
<!--#include file="eqq.asp" -->