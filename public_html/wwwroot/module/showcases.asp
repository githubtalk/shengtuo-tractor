<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/webset.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->
<!--#include file="nav.asp" -->
<!--#include file="home_url.asp" -->
<%
dim id,rs,exec
id = request.querystring("id")
If id="" Then     
server_v40=Request.ServerVariables("QUERY_STRING")    
id=Int(replace(replace(server_v40,"/",""),".html",""))  
End If  

if id = "" or not isnumeric(id) then
response.write "<script>alert('非法操作');history.back();</script>"
response.end
end if

exec="select * from cases where id="&id
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

<!--#include file="left4.asp" -->
<!--#include file="hot.asp" -->
<!--#include file="adv.asp" -->
<!--#include file="flink.asp" -->
<!--#include file="eqq.asp" -->