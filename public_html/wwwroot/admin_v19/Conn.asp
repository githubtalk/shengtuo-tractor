<%
	dim conn
	set conn = server.createobject("adodb.connection")  
	conn.connectionstring="Provider = Microsoft.Jet.OLEDB.4.0;Data Source="&server.mapPath("../data/#shop34915220.asp") 
	conn.open
	ON ERROR RESUME NEXT
	session.Timeout = 999
	Server.ScriptTimeOut=999999
%>


