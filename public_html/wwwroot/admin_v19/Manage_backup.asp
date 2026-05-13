<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
'######################################
' 蓝科外贸网站管理系统中英文双语版
' Lanke Enterprise Web Site Management System
' 官方网站：http://www.lankecms.com
' 联系QQ：593036114
' 淘宝店： http://51020.taobao.com
'######################################
%>
<link href="images/style.css" type="text/css" rel="stylesheet" />

<table width="100%" height="97%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><table width="95%" border="0" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC" class="table_southidc">
        <tr> 
          <td height="12" bgcolor="#F7F7F7" class="back_southidc"> <div align="left"><strong>备份数据库</strong> | <a href="Manage_Restore.asp">恢复数据库</a></div></td>
        </tr>
        
        <tr class="tr_southidc"> 
          <form method="post" action="Manage_backup.asp?action=Backup">
            <td bgcolor="#FFFFFF"><span class="back_southidc"><br>
              <%
if request("action")="Backup" then
call backupdata()
else
%>
            </span><br> 
              <table width="91%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25"><strong>备份数据库文件</strong>[需要FSO权限]</td>
                </tr>
                <tr> 
                  <td height="22"> 当前数据库路径</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=50 name=DBpath value="../data/#shop34915220.asp"></td>
                </tr>
                <tr> 
                  <td height="22"><input type="hidden" size=50 name=bkfolder value=Databackup ></td>
                </tr>
                <tr> 
                  <td height="22">备份数据库名称</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=30 name=bkDBname value="<%=date()%>.asp"> <font color="#FF0000">记住您备份的名称，恢复时需要用这个名称进行恢复。</font></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="left"><br />
                      <input type=submit value="确定备份">
                  </div></td></tr>
                <tr> 
                  <td height="25" style=" line-height:25px;"><br>
                 
                    本程序的默认数据库路径为:<font color="#FF0000">/data/#shop34915220.asp</font><br>
                    您可以用这个功能来备份您重要的数据，以保证您网站的信息安全！<br></td>
                </tr>
                <tr> 
                  <td height="22">&nbsp;</td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <%end if%>
    <% 
sub backupdata() 
Dbpath=request.form("Dbpath") 
Dbpath=server.mappath(Dbpath) 
bkfolder=request.form("bkfolder") 
bkdbname=request.form("bkdbname") 
Set Fso=server.createobject("scripting.filesystemobject") 
if fso.fileexists(dbpath) then 
If CheckDir(bkfolder) = True Then 
fso.copyfile dbpath,bkfolder& "\"& bkdbname 
else 
MakeNewsDir bkfolder 
fso.copyfile dbpath,bkfolder& "\"& bkdbname & ".mdb"
end if 
response.write "<left>&nbsp;&nbsp;&nbsp;&nbsp;备份数据库成功，备份的数据库为 " & bkfolder & "\" & bkdbname & "</left><br><br><br><left>&nbsp;&nbsp;&nbsp;&nbsp;<a href=javascript:history.go(-1);><span class=a>【返回继续管理操作】<span></a></left>" 
Else 
response.write "找不到您所需要备份的文件。" 
End if 
end sub 
'------------------检查某一目录是否存在------------------- 
Function CheckDir(FolderPath) 
folderpath=Server.MapPath(".")&"\"&folderpath 
Set fso1 = CreateObject("Scripting.FileSystemObject") 
If fso1.FolderExists(FolderPath) then 
'存在 
CheckDir = True 
Else 
'不存在 
CheckDir = False 
End if 
Set fso1 = nothing 
End Function 
'-------------根据指定名称生成目录--------- 
Function MakeNewsDir(foldername) 
Set fso1 = CreateObject("Scripting.FileSystemObject") 
Set f = fso1.CreateFolder(foldername) 
MakeNewsDir = True 
Set fso1 = nothing 
End Function 
%></td>
  </tr>
</table>

