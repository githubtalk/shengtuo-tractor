<!--#include file="utf-8.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="../module/showcases.asp"-->

<%
Template="../template/showcases.htm" '模版
str=ReadFromUTF(Template,"utf-8") '编码
content=Replace(str,"{Lankecms_webtitle}",Lankecms_webtitle) '替换
content=Replace(content,"{Lankecms_title}",Lankecms_title)
content=Replace(content,"{Lankecms_keyword}",Lankecms_keyword)
content=Replace(content,"{Lankecms_description}",Lankecms_description)
content=Replace(content,"{Lankecms_logo}",Lankecms_logo)
content=Replace(content,"{Lankecms_adv}",Lankecms_adv)
content=Replace(content,"{Lankecms_img}",Lankecms_img)
content=Replace(content,"{Lankecms_data}",Lankecms_data)
content=Replace(content,"{id}",id)
content=Replace(content,"{Lankecms_body}",Lankecms_body)
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


Filen="../cases/"&id&".html" '静态存放位置
Call WriteToUTF(content,Filen) '生成静态页
If Not Err Then Response.Write "<a href='"&root&"/cases/"&id&".html' target='_blank'>cases/"&id&".html</a>...案例生成成功！</br>"

Function ReadFromUTF(TempString,CharSet) '路径；编码
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