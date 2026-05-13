<!-- #include file="../Inc/evars.asp" -->
<%
dim eqq
if c_isqq="1" then
if msn_num<>"" or tt_skype<>"" or qq_num<>"" or wang_num<>"" or alibaba_num<>"" then
eqq = eqq & "<script type='text/javascript' src='"&root&"/js/eqq.js'></script>"&vbcrlf

eqq = eqq & "<div id='leftDiv' style='top:210px; left:10px;'></div>"&vbcrlf
eqq = eqq & "<div id='rightDiv' style='top:210px; right:10px;'>"&vbcrlf
eqq = eqq & "<div id='rightDiv_top'></div>"&vbcrlf
eqq = eqq & "<div id='rightDiv_middle'>"&vbcrlf

'==开始遍历msn号码
if msn_num<>"" then
msn_num=split(msn_num,",")
msn_name=split(msn_name,",")
for i=lbound(msn_num) to ubound(msn_num)
eqq = eqq & "<a href='msnim:chat?contact="&trim(msn_num(i))&"' target='blank'>"&vbcrlf
eqq = eqq & "<img src='"&root&"/images/msn.jpg' border='0' />"&vbcrlf
eqq = eqq & "<span>&nbsp;"&trim(msn_name(i))&"</span>"&vbcrlf
eqq = eqq & "</a>"&vbcrlf
next
end if

'==开始遍历skype号码
if tt_skype<>"" then
skype=split(tt_skype,",")
for j=lbound(skype) to ubound(skype)
eqq = eqq & "<a href='callto://"&trim(skype(j))&"' target='blank'>"&vbcrlf
eqq = eqq & "<img src='"&root&"/images/skype.gif' border='0' />"&vbcrlf
eqq = eqq & "<span>&nbsp;"&trim(skype(j))&"</span>"&vbcrlf
eqq = eqq & "</a>"&vbcrlf
next
end if 


'==开始遍历QQ号码
if qq_num<>"" then
qq_num=split(qq_num,",")
qq_name=split(qq_name,",")
for q=lbound(qq_num) to ubound(qq_num)
eqq = eqq & "<a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin="&trim(qq_num(q))&"&Site="&trim(qq_name(q))&"&menu=yes'>"&vbcrlf
eqq = eqq & "<img border='0' src='http://wpa.qq.com/pa?p=1:"&trim(qq_num(q))&":4'>"&vbcrlf
eqq = eqq & "<span>&nbsp;"&trim(qq_name(q))&"</span>"&vbcrlf
eqq = eqq & "</a>"&vbcrlf
next
end if



'==开始遍历阿里旺旺号码
if wang_num<>"" then
wang_num=split(wang_num,",")
for w=lbound(wang_num) to ubound(wang_num)
eqq = eqq & "<a target='_blank' href='http://www.taobao.com/webww/ww.php?ver=3&touid="&trim(wang_num(w))&"&siteid=cntaobao&status=1&charset=utf-8'>"&vbcrlf
eqq = eqq & "<img border='0' src='http://amos.alicdn.com/realonline.aw?v=2&uid="&trim(wang_num(w))&"&site=cntaobao&s=1&charset=utf-8' />"&vbcrlf
eqq = eqq & "</a>"&vbcrlf
next
end if



'==开始遍历贸易通
if alibaba_num<>"" then
alibaba_num=split(alibaba_num,",")
for z=lbound(alibaba_num) to ubound(alibaba_num)
eqq = eqq & "<a target='_blank' href='http://amos.alicdn.com/msg.aw?v=2&uid="&trim(alibaba_num(z))&"&site=cnalichn&s=10&charset=UTF-8'>"&vbcrlf
eqq = eqq & "<img border='0' src='http://amos.alicdn.com/online.aw?v=2&uid="&trim(alibaba_num(z))&"&site=cnalichn&s=10&charset=UTF-8' />"&vbcrlf
eqq = eqq & "</a>"&vbcrlf
next
end if


eqq = eqq & "</div>"&vbcrlf
eqq = eqq & "<div id='rightDiv_bottom'></div>"&vbcrlf
eqq = eqq & "</div>"&vbcrlf


end if
end if
%>