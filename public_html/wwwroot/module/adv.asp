<%
'焦点广告
dim Lankecms_adv
set db=conn.execute("select top 5 * from [flash] order by px_id asc")
		if db.eof then
		Lankecms_adv = Lankecms_adv & "var files=''"&vbcrlf
		Lankecms_adv = Lankecms_adv & "var links=''"&vbcrlf
		Lankecms_adv = Lankecms_adv & "var texts=''"&vbcrlf
		else
			i=0
			do while not db.eof
				 files=files&"|"&root&db("img")
				 links=links&"|"&db("link")
				db.moveNext
				i=i+1
			loop
			Lankecms_adv = Lankecms_adv & "files+='|"&right(files,len(files)-1)&"'"&vbcrlf
		    Lankecms_adv = Lankecms_adv & "links+='|"&right(links,len(links)-1)&"'"&vbcrlf
            end if
%>