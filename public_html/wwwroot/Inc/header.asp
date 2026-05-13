<!--#include file="../module/nav.asp" -->
<div id="header">

    <div id="logo"><img src="<%=root%><%=config("bg")%>"></div>
    
    <div class="globalsearchformzone">
        <form id="globalsearchform" name="search" method="get" action="<%=root%>/search/search.asp">
            <div class="globalsearchform">
                <input name="search1" type="text" class="input" />
            </div>
            <div class="globalsearchform1">
              <input name="imageField" type="image" src="../images/searchr.png" class="imgbutton" />
            </div>
        </form>
    </div>
    
    <div id="nav">
        <ul>
<%=Lankecms_nav%>
        </ul>
    </div>
    
</div>
<!-- end of header -->

<div class="flash">
    <!--焦点广告-->
	<script type="text/javascript">
    var swf_width=968;var swf_height=350;
    /*-- 参数 自动播放时间(秒)|文字颜色|文字背景色|文字背景透明度|按键数字颜色|当前按键颜色|普通按键色彩 */
    var config='5|0xffffff|0x000000|50|0xffffff|0xeb6100|0xa3a3a3';
    var files='',links='', texts='';
    <%
    set db=conn.execute("select top 5 * from [flash] order by px_id asc")'默认显示五条最新广告
    if db.eof then
    response.write "var files=''"
    response.write "var links=''"
    response.write "var texts=''"
    else
        i=0
        do while not db.eof
             files=files&"|"&root&db("img")
             links=links&"|"&db("link")
            db.moveNext
            i=i+1
        loop
        response.write "files+='|"&right(files,len(files)-1)&"'"&vbcrlf
        response.write "links+='|"&right(links,len(links)-1)&"'"&vbcrlf
        end if
    %>
    files=files.substring(1);
    links=links.substring(1);texts=texts.substring(1);
    document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
    document.write('<param name="movie" value="<%=root%>/images/focus.swf" />');
    document.write('<param name="quality" value="high" />');
    document.write('<param name="menu" value="false" />');
    document.write('<param name=wmode value="opaque" />');
    document.write('<param name="FlashVars" value="config='+config+'&bcastr_flie='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'" />');
    document.write('<embed src="<%=root%>/images/focus.swf" wmode="opaque" FlashVars="config='+config+'&bcastr_flie='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
    document.write('</object>');
    </script> 
</div>
<!-- end of flash -->