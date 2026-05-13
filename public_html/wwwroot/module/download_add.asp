<!--#include file="../Inc/webset.asp"-->
<!--#include file="config.asp" -->
<!--#include file="nav.asp" -->
<!--#include file="home_url.asp" -->
<%
exec="select * from download where id="&id
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

'案例信息
Lankecms_title = rs("title")
Lankecms_keyword = rs("keyword")
Lankecms_description = rs("description2")
Lankecms_img = rs("img")
Lankecms_data = rs("data")
id = rs("id")
Lankecms_body = rs("body")

Lankecms_etitle = rs("etitle")
Lankecms_ekeyword = rs("ekeyword")
Lankecms_edescription = rs("edescription2")
Lankecms_ebody = rs("ebody")
%>

<!--#include file="left5.asp" -->
<!--#include file="adv.asp" -->
<!--#include file="hot.asp" -->
<!--#include file="flink.asp" -->
<!--#include file="eqq.asp" -->