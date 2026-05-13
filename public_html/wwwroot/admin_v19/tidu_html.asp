<!--#include file="utf-8.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="../module/webditu.asp"-->

<%
Template="../template/webtitu.htm" '模版文件存放位置
str=ReadFromUTF(Template,"utf-8") '读取模版,注意编码对应模版文件编码
content=Replace(str,"{Lankecms_webtitle}",Lankecms_webtitle) '将模版中标记的内容替换成实际需要的内容
content=Replace(content,"{Lankecms_web_keywords}",Lankecms_web_keywords)
content=Replace(content,"{Lankecms_web_description}",Lankecms_web_description)
content=Replace(content,"{root}",root)
content=Replace(content,"{Lankecms_wz}",Lankecms_wz)
content=Replace(content,"{Lankecms_enurl}",Lankecms_enurl)
content=Replace(content,"{Lankecms_cnurl}",Lankecms_cnurl)
content=Replace(content,"{aboutfl}",aboutfl)

content=Replace(content,"{shopfl}",shopfl)
content=Replace(content,"{showshop}",showshop)
content=Replace(content,"{eshowshop}",eshowshop)

content=Replace(content,"{newsfl}",newsfl)
content=Replace(content,"{shownews}",shownews)
content=Replace(content,"{eshownews}",eshownews)

content=Replace(content,"{casesfl}",casesfl)
content=Replace(content,"{showcases}",showcases)
content=Replace(content,"{eshowcases}",eshowcases)

content=Replace(content,"{downloadfl}",downloadfl)
content=Replace(content,"{showdownload}",showdownload)
content=Replace(content,"{eshowdownload}",eshowdownload)


Filen="../sitemap.html" '生成静态页文件存放位置
Call WriteToUTF(content,Filen) '生成静态页
If Not Err Then Response.Write "<a href='../sitemap.html' target='_blank'>"&Filen&"</a>...首页生成成功</br>"

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