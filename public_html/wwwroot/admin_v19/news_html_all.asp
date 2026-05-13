<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/webset.asp"-->
<!--#include file="../module/config.asp" -->
<!--#include file="../module/nav.asp" -->
<!--#include file="../module/flink.asp" -->
<!--#include file="../module/eqq.asp" -->
<!--#include file="../module/adv.asp" -->
<%
dim id,rs,exec

exec="select * from news"
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1
while not rs.eof

id = rs("id")
a1=id

if rs.eof then
rs.close
set rs = nothing
conn.close
set conn = nothing
response.write "不存在些信息"
response.end
end if 

'新闻信息
Lankecms_title = rs("title")
Lankecms_keyword = rs("keyword")
Lankecms_description = rs("description2")
Lankecms_newstitle = rs("title")
id = rs("id")
Lankecms_data = rs("data")
Lankecms_body = rs("body")
%>
<!--#include file="../module/news_point.asp" -->
<!--#include file="../module/left3.asp" -->
<!--#include file="../module/hot.asp" -->
<%
Template="../template/ShowNews.htm" '模版
str=ReadFromUTF(Template,"utf-8") '编码
content=Replace(str,"{Lankecms_title}",Lankecms_title)
content=Replace(content,"{Lankecms_keyword}",Lankecms_keyword)
content=Replace(content,"{Lankecms_description}",Lankecms_description)
content=Replace(content,"{Lankecms_logo}",Lankecms_logo)
content=Replace(content,"{Lankecms_enurl}",Lankecms_enurl)
content=Replace(content,"{Lankecms_cnurl}",Lankecms_cnurl)
content=Replace(content,"{Lankecms_adv}",Lankecms_adv)
content=Replace(content,"{Lankecms_newstitle}",Lankecms_newstitle)
content=Replace(content,"{Lankecms_data}",Lankecms_data)
content=Replace(content,"{id}",id)
content=Replace(content,"{Lankecms_body}",Lankecms_body)
content=Replace(content,"{Lankecms_prev}",Lankecms_prev)
content=Replace(content,"{Lankecms_next}",Lankecms_next)
content=Replace(content,"{Lankecms_copyright}",Lankecms_copyright)
content=Replace(content,"{Lankecms_share}",Lankecms_share)
content=Replace(content,"{Lankecms_beian}",Lankecms_beian)
content=Replace(content,"{Lankecms_dz}",Lankecms_dz)
content=Replace(content,"{Lankecms_tel}",Lankecms_tel)
content=Replace(content,"{Lankecms_fax}",Lankecms_fax)
content=Replace(content,"{Lankecms_email}",Lankecms_email)
content=Replace(content,"{Lankecms_name}",Lankecms_name)
content=Replace(content,"{Lankecms_nav}",Lankecms_nav)
content=Replace(content,"{Lankecms_leftnav}",Lankecms_leftnav)
content=Replace(content,"{Lankecms_hot}",Lankecms_hot)
content=Replace(content,"{Lankecms_flink}",Lankecms_flink)
content=Replace(content,"{eqq}",eqq)
content=Replace(content,"{root}",root)

Filen="../News/"&id&".html" '静态存放位置
Call WriteToUTF(content,Filen) '生成静态页
If Not Err Then Response.Write "<a href='"&root&"/News/"&id&".html' target='_blank'>News/"&id&".html</a>...生成成功！</br>"

Lankecms_leftnav = ""
Lankecms_hot = ""

rs.movenext
wend
rs.close
set rs=nothing
%>

<%
Function ReadFromUTF(TempString,CharSet) 'TempString为要读取的模版文件路径；Charset是编码
Dim str
Set stm=server.CreateObject("adodb.stream")
stm.Type=2
stm.Mode=3
stm.Charset=CharSet
stm.Open
stm.loadfromfile Server.MapPath(TempString)
str=stm.readtext
stm.Close
Set stm=Nothing
ReadFromUTF=str
End Function

Function WriteToUTF(content,Filen) '将替换后的内容写入HTML文档,content为替换后的字符串,Filen为生成的文件名
Set objStream=Server.CreateObject("ADODB.Stream")
    With objStream
    .Open
    .Charset="utf-8" '编码，这里你可以改成任何编码
    .Position=objStream.Size
    .WriteText=content '模版+数据 写入内容
    .SaveToFile server.mappath(Filen),2 '生成文件路径
    .Close
    End With
Set objStream=Nothing
End Function
%>