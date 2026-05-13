<%
  if session("admin")="" then
  response.write "<script>alert('非法操作，请先登陆后再进行操作！');window.location.href='index.asp';</script>"
  end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>asp图片无组件上传程序(杜绝上传漏洞)1.0</title>
<style type="text/css">
<!--
body {
	margin:0;
	padding:0;
	font-size: 12px;
}
-->
</style>
</head>
<body>
<!--#include file="upload_youyiweb.inc"-->
<!--#include file="../Inc/webset.asp"-->
<%
dim jpg(1):jpg(0)=CByte(&HFF):jpg(1)=CByte(&HD8)
dim bmp(1):bmp(0)=CByte(&H42):bmp(1)=CByte(&H4D)
dim png(3):png(0)=CByte(&H89):png(1)=CByte(&H50):png(2)=CByte(&H4E):png(3)=CByte(&H47)
dim gif(5):gif(0)=CByte(&H47):gif(1)=CByte(&H49):gif(2)=CByte(&H46):gif(3)=CByte(&H39):gif(4)=CByte(&H38):gif(5)=CByte(&H61)
dim filemaxsize,filesavepath,InceptFileType

'=================上传参数设置=======================
filemaxsize=2000*1024'文件大小B为单位500K
filesavepath=""&root&"/uploadfile/"'文件保存路径,如果不存在会自动创建
yearmonth=0'在filesavepath目录以下创建以年月 的目录来保存图片文件,如果不创建以年月的目录,则为0
InceptFileType=	"gif,jpg,bmp,jpeg,png"	'允许的上传类型	
'===============================================
filesavepath=folder(filesavepath,yearmonth)
call ChkPost()'禁止远程提交
Set Upload = New UpFile_Class						
Upload.InceptFileType = InceptFileType
Upload.MaxSize = filemaxsize	
Upload.GetDate()	
If Upload.Err > 0 Then
	Select Case Upload.Err
		Case 1 : Response.Write "请先选择你要上传的文件　[ <a href=# onclick=history.go(-1)>重新上传</a> ]"
		Case 2 : Response.Write "图片大小超过了限制 "&int(filemaxsize/1024)&"K　[ <a href=# onclick=history.go(-1)>重新上传</a> ]"
		Case 3 : Response.Write "所上传类型不正确　[ <a href=# onclick=history.go(-1)>重新上传</a> ]"
	End Select
Else
	 
	 For Each FormName in Upload.file		
		 Set File = Upload.File(FormName)	
		 If File.Filesize<10 Then
			Response.Write "请先选择你要上传的图片　[ <a href=# onclick=history.go(-1)>重新上传</a> ]"
		End If
		FileExt	= FixName(File.FileExt)
		'If Not ( CheckFileExt(FileExt) and CheckFileType(File.FileType) ) Then
			'Response.Write "文件格式不正确　[ <a href=# onclick=history.go(-1)>重新上传</a> ]"
		'End If
		back_form_text=upload.form("back_form")
		FileName=filesavepath&UserFaceName(FileExt)
		FileName= Replace(FileName,chr(0),"")
		FileName= Replace(FileName,"//","/")
		
		FileName2= Replace(FileName,""&root&"","")
		'Response.Write(FileName)
		If File.FileSize>0 Then   
			File.SaveToFile Server.mappath(FileName)   '保存文件
			If not CheckFileType(Server.mappath(filename)) then
				Response.Write "<script language=""javascript"">window.alert(""警告\n上传文件非法,你的ip和时间已被纪录"
				Response.Write "\n我们将会把你的数据向公安部及网警报告！"");history.go(-1);</script>"
				set fso=server.createObject("scripting.fileSystemObject")
				Set ficn = fso.GetFile(Server.mappath(filename))
				ficn.delete
				set ficn=nothing
				set fso=nothing
				
				set fso=server.createObject("scripting.fileSystemObject")
				set wfile=fso.opentextfile(server.mappath("gjrz.txt"),8, TRUE)
				wfile.writeline date()&" "&time()&" "&request.servervariables("remote_addr")&" "&str
				set ficn=nothing
				set fso=nothing
	         else
			    if back_form_text<>"" then
				   Response.write "<script language=""javascript"">parent.document."&back_form_text&".value='"&FileName2&"';"
				   Response.Write "window.alert(""文件上传成功!"");history.go(-1);</script>"
				else
				   Response.Write "文件上传成功:<a href='"&filename&"'>"&filename&"</a><input type='bottom' value='重新上传' onClick='history.go(-1);'>"
				end if
		    end if
		End If
		Set File=Nothing
	Next
End If
Set Upload=Nothing
	
	
Private Function CheckFileExt(FileExt)
	Dim ForumUpload,i
	if len(FileExt)>4 then
		CheckFileExt=True
		Exit Function
	end if
	ForumUpload="gif,jpg,bmp,jpeg,png"
	ForumUpload=Split(ForumUpload,",")
	CheckFileExt=False
	For i=0 to UBound(ForumUpload)
		If LCase(FileExt)=Lcase(Trim(ForumUpload(i))) Then
			CheckFileExt=True
			Exit Function
		End If
	Next
End Function


Function FixName(UpFileExt)
	If IsEmpty(UpFileExt) Then Exit Function
	FixName = Lcase(UpFileExt)
	FixName = Replace(FixName,Chr(0),"")
	FixName = Replace(FixName,".","")
	FixName = Replace(FixName,"asp","")
	FixName = Replace(FixName,"asa","")
	FixName = Replace(FixName,"aspx","")
	FixName = Replace(FixName,"cer","")
	FixName = Replace(FixName,"cdx","")
	FixName = Replace(FixName,"htr","")
End Function


Private Function UserFaceName(FileExt)
    dim RanNum
	Randomize
	RanNum = Int(9000*rnd)+1000
 	UserFaceName = Year(now)&Month(now)&Day(now)&Hour(now)&Minute(now)&Second(now)&RanNum&"."&FileExt
End Function


Private Function folder(FileType,is_date)'以年月创建保存的目录
	set upf=server.CreateObject("Scripting.FileSystemObject")
	If Err<>0 Then
		Err.Clear
		folder=""
		exit Function
	End If
	If upf.FolderExists(Server.MapPath(FileType))=False Then
		If upf.FolderExists(Server.MapPath(FileType))=False Then		
			upf.CreateFolder Server.MapPath(FileType)		
		End If
	End If	
	Set upf=Nothing
	
	if is_date=1 then
		f_name=month(now)
		if f_name<10 then
			f_name="0"&f_name
		end if
		f_name= FileType&year(now)&f_name&"/"
		set upf=server.CreateObject("Scripting.FileSystemObject")
		If upf.FolderExists(Server.MapPath(f_name))=False Then
			If upf.FolderExists(Server.MapPath(f_name))=False Then		
				upf.CreateFolder Server.MapPath(f_name)		
			End If
		End If
		Set upf=Nothing
	else		
        f_name=FileType&"/"
	end if
	folder=f_name
End Function


function CheckFileType(filename)
    adTypeBinary=1
	CheckFileType=false
	dim fstream,fileExt,stamp,i
	fileExt=mid(filename,InStrRev(filename,".")+1)
	set fstream=Server.createobject("ADODB.Stream")
	fstream.Open
	fstream.Type=adTypeBinary
	fstream.LoadFromFile filename
	fstream.position=0
	select case fileExt
	case "jpg","jpeg"
		stamp=fstream.read(2)
		for i=0 to 1
			if ascB(MidB(stamp,i+1,1))=jpg(i) then CheckFileType=true else CheckFileType=false
		next
	case "gif"
		stamp=fstream.read(6)
		for i=0 to 5
			if ascB(MidB(stamp,i+1,1))=gif(i) then CheckFileType=true else CheckFileType=false
		next
	case "png"
		stamp=fstream.read(4)
		for i=0 to 3
			if ascB(MidB(stamp,i+1,1))=png(i) then CheckFileType=true else CheckFileType=false
		next
	case "bmp"
		stamp=fstream.read(2)
		for i=0 to 1
			if ascB(MidB(stamp,i+1,1))=bmp(i) then CheckFileType=true else CheckFileType=false
		next
	end select
	fstream.Close
	set fseteam=nothing
	if err.number<>0 then CheckFileType=false
end function
function ChkPost() 
   dim server_v1,server_v2
   chkpost=false
   server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
   server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
   If Mid(server_v1,8,Len(server_v2))<>server_v2 then
     Response.Write "<script>alert('警告！你正在从外部提交数据,请立即终止！');window.location.href='http://www.gdnet110.gov.cn/';</SCRIPT>"
	 Response.end
   end If
end function
%>
</body>
</html>