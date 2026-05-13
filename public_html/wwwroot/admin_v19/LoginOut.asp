<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp" -->
<%
session.Abandon()
if Request.QueryString("zx")="ok" then
   Response.Write("<script language=""JavaScript"">alert(""注消成功！请重新登陆本系统！"");</script>")
   response.write "<Meta http-equiv='refresh' content='0;URL=index.asp'>"
else
	Response.Write("<script language=""JavaScript"">alert(""安全退出后台管理系统！"");</script>")
	response.write "<Meta http-equiv='refresh' content='0;URL=/'>"
end if
response.End
%>