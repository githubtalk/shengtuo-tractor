<%
if session("admin")="" then
response.write "<script>alert('非法操作，请先登陆后再进行操作！');window.location.href='index.asp';</script>"
end if

   dim server_v1,server_v2
   chkpost=false
   server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
   server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
   If Mid(server_v1,8,Len(server_v2))<>server_v2 then
     Response.Write "<script>alert('警告！你正在从外部提交数据,请立即终止！');window.location.href='http://www.gdnet110.gov.cn/';</SCRIPT>"
	 Response.end
   end If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<!--#include file="conn.asp"-->
<!--#include file="function.asp"-->
<%
Const MaxPerPage=20
dim totalPut,CurrentPage,TotalPages
dim UploadDir,TruePath,fso,theFolder,theFile,whichfile,thisfile,FileCount,TotleSize

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

if right(SaveUpFilesPath,1)<>"/" then
	UploadDir="../" & SaveUpFilesPath & "/"
else
	UploadDir="../" & SaveUpFilesPath
end if
TruePath=Server.MapPath(UploadDir)
If not IsObjInstalled("Scripting.FileSystemObject") Then
	Response.Write "<b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能</font></b>"
Else
	set fso=CreateObject("Scripting.FileSystemObject")
	if request("Action")="Del" then
		whichfile=server.mappath(Request("FileName")) 
		Set thisfile = fso.GetFile(whichfile) 
		thisfile.Delete True
	end if

%>
<link href="images/style.css" type="text/css" rel="stylesheet" />
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="862" align="center" valign="top">
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td height="30" bgcolor="#FFFFFF"><div align="center">
              <table width="100%" border="0" cellpadding="0" cellspacing="1">
                <tr>
                  <td height="30" bgcolor="#F7F7F7"><div  style="padding-left:20px;"><strong>上 
                  传 文 件 管 理</strong>　　　　　</div></td>
                </tr>
              </table>
          </div></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF"><table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
              <tr>
                <td width="89%" height="37" bgcolor="#FFFFFF"><%
  if fso.FolderExists(TruePath)then
	FileCount=0
	TotleSize=0
	Set theFolder=fso.GetFolder(TruePath)
	For Each theFile In theFolder.Files
		FileCount=FileCount+1
		TotleSize=TotleSize+theFile.Size
	next
    totalPut=FileCount
	if currentpage<1 then
   		currentpage=1
   	end if
   	if (currentpage-1)*MaxPerPage>totalput then
		if (totalPut mod MaxPerPage)=0 then
	  		currentpage= totalPut \ MaxPerPage
	  	else
	      	currentpage= totalPut \ MaxPerPage + 1
		end if

    end if
	if currentPage=1 then
		showpage2 strFileName,totalput,MaxPerPage
		showContent     	
		showpage2 strFileName,totalput,MaxPerPage
		response.write "<br><div align='center'>本页共显示 <b>" & FileCount & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K</div>"
   	else
   	   	if (currentPage-1)*MaxPerPage<totalPut then
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>本页共显示 <b>" & FileCount & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K</div>"
       	else
        	currentPage=1
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>本页共显示 <b>" & FileCount & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K</div>"
    	end if
	end if
  else
	response.write "找不到文件夹！可能是配置有误！"
  end if
end if

sub showContent()
   	dim c
	FileCount=0
	TotleSize=0
%></td>
              </tr>
              <tr>
                <td bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="2" cellspacing="0" class="border">
                  <tr bgcolor="A4B6D7" class="title">
                    <td height="25" colspan="2" align="center" bgcolor="#CCCCCC">文件名</td>
                    <td width="128" height="20" align="center" bgcolor="#CCCCCC">文件大小</td>
                    <td width="136" height="20" align="center" bgcolor="#CCCCCC">文件类型</td>
                    <td width="255" height="20" align="center" bgcolor="#CCCCCC">最后修改时间</td>
                    <td width="65" height="20" align="center" bgcolor="#CCCCCC">操作</td>
                  </tr>
                  <%

For Each theFile In theFolder.Files
	c=c+1
	if FileCount>=MaxPerPage then
		exit for
	elseif c>MaxPerPage*(CurrentPage-1) then
%>
                  <tr class="tdbg">
                    <td width="132" height="22" bgcolor="#FFFFFF"><a href="<%=(UploadDir & theFile.Name)%>" target="_blank" class="img"><img src="<%=(UploadDir & theFile.Name)%>" alt="点击在新窗口浏览图片原尺寸" width="65" height="65" border="0"  onload="javascript:if(this.width&gt;150)this.width=150" /></a></td>
                    <td width="370" bgcolor="#FFFFFF"><input type="text" class="bule" value="/<%=SaveUpFilesPath&"/"&theFile.Name%>" size="30" disabled="disabled" />
                      <button  onclick="window.clipboardData.setData('text',this.previousSibling.value)">复制</button></td>
                    <td width="128" align="right" bgcolor="#FFFFFF"><%=theFile.size%>字节</td>
                    <td width="136" align="center" bgcolor="#FFFFFF"><%=theFile.type%></td>
                    <td width="255" align="center" bgcolor="#FFFFFF"><%=theFile.DateLastModified%></td>
                    <td width="65" align="center" bgcolor="#FFFFFF"><input type="button" name="Submit" value="删除" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='<%=strFileName%>Action=Del&amp;FileName=<%=UploadDir&theFile.Name%>';}else{history.go(0);}" /> </td>
                  </tr>
                  <%
		FileCount=FileCount+1
		TotleSize=TotleSize+theFile.Size
	end if
Next
%>
                </table></td>
              </tr>
            </table>
              </form>
          </td>
        </tr>
      </table>
    <%
end sub
%> </td>
  </tr>
</table>
<%
sub showpage2(sfilename,totalnumber,maxperpage)
	dim n, i,strTemp
	if totalnumber mod maxperpage=0 then
    	n= totalnumber \ maxperpage
  	else
    	n= totalnumber \ maxperpage+1
  	end if
  	strTemp= "<table align='center'><form name='showpages' method='Post' action='" & sfilename & "'><tr><td>"
	strTemp=strTemp & "共 <b>" & totalnumber & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K&nbsp;&nbsp;&nbsp;"
	sfilename=JoinChar(sfilename)
  	if CurrentPage<2 then
    		strTemp=strTemp & "首页 上一页&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=1'>首页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage-1) & "'>上一页</a>&nbsp;"
  	end if

  	if n-currentpage<1 then
    		strTemp=strTemp & "下一页 尾页"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage+1) & "'>下一页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & n & "'>尾页</a>"
  	end if
   	strTemp=strTemp & "&nbsp;页次：<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>页 "
    strTemp=strTemp & "&nbsp;<b>" & maxperpage & "</b>" & "个文件/页"
	strTemp=strTemp & "&nbsp;转到：<select name='page' size='1' onchange='javascript:submit()'>"   
    for i = 1 to n   
   		strTemp=strTemp & "<option value='" & i & "'"
		if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
		strTemp=strTemp & ">第" & i & "页</option>"   
	next
	strTemp=strTemp & "</select>"
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
end sub
%>

