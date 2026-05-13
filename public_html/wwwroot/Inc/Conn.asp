<!--#include file="webset.asp" -->
<%
	dim conn
	set conn = server.createobject("adodb.connection")  
	conn.connectionstring="Provider = Microsoft.Jet.OLEDB.4.0;Data Source="&server.mapPath(""&root&"/data/#shop34915220.asp") 
	conn.open 
	ON ERROR RESUME NEXT 
%>
<!--#include file="home_url.asp" -->