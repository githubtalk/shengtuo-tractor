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
          <td height="12" bgcolor="#F7F7F7" class="back_southidc"> <div align="left"><a href="Manage_backup.asp">备份数据库</a> | <strong>恢复数据库</strong></div></td>
        </tr>
        
        <tr class="tr_southidc"> 
          <form method="post" action="Manage_Restore.asp?action=RestoreData&act=Restore">
            <td bgcolor="#FFFFFF"><span class="back_southidc"><br>
              <%
if request("action")="RestoreData" then
call RestoreData()
else
%>
            </span><br> 
              <table width="91%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25"><strong>恢复数据库文件</strong>[需要FSO权限]</td>
                </tr>
                <tr> 
                  <td height="22"> 从哪里：</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=30 name=DBpath value="DataBackup\<%=Date()%>.asp" />
                  <font color="#FF0000">请填写你备份的数据库名称</font></td>
                </tr>
                <tr> 
                  <td height="22"><input type="hidden" size=50 name=bkfolder value=Databackup ></td>
                </tr>
                <tr> 
                  <td height="22">恢复到哪里：</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=30 name=backpath value="../data/#shop34915220.asp"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="left"><br />
                      <input type=submit value="开始还原">
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
sub RestoreData() 
dim backpath
if request("act")="Restore" Then
Dbpath=request.form("Dbpath")
backpath=request.form("backpath")
if dbpath="" Then
response.write "Please input your database whole Name" 
else
Dbpath=server.mappath(Dbpath)
end If
backpath=server.mappath(backpath)

Set Fso=server.CreateObject("scripting.filesystemobject")
if fso.fileexists(dbpath) Then 
fso.copyfile Dbpath,Backpath
response.write "数据库被成功还原!<br>"
else
response.write "没找到您所需要的数据库!" 
end If 
end If 
end sub
%>
</td>
  </tr>
</table>

