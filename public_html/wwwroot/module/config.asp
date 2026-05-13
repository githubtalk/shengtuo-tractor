<% 
set config=server.createobject("adodb.recordset") 
exec="select * from config" 
config.open exec,conn,1,1

Lankecms_webtitle = config("title")
Lankecms_web_keywords=config("keywords")
Lankecms_web_description=config("description")
Lankecms_wz = config("url")
Lankecms_logo = config("bg")
Lankecms_copyright = config("copyright")
Lankecms_share = config("share")
Lankecms_beian = config("beian")
Lankecms_dz = config("dz")
Lankecms_tel = config("tel")
Lankecms_fax = config("fax")
Lankecms_email = config("mail")
Lankecms_name = config("name")
%>