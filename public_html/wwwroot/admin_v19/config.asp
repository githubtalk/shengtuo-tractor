<% 
set config=server.createobject("adodb.recordset") 
exec="select * from config" 
config.open exec,conn,1,1 
%>