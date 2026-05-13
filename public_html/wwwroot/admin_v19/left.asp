<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<html>
<head>
<title>left</title>
<style type="text/css">
body {
background-color: #EBEBEB; 
color: #336699; 
SCROLLBAR-FACE-COLOR: #BED8EB; 
SCROLLBAR-SHADOW-COLOR: #DDF8FF; 
SCROLLBAR-HIGHLIGHT-COLOR: #92C0D1; 
SCROLLBAR-3DLIGHT-COLOR: #DDF8FF; 
SCROLLBAR-DARKSHADOW-COLOR: #92C0D1; 
SCROLLBAR-TRACK-COLOR:#BED8EB; 
SCROLLBAR-ARROW-COLOR: #92C0D1 
}

<!--
*{margin:0;padding:0;border:0;}
body {font-family: arial, 宋体, serif;font-size:12px;margin-left: 3px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;}
#nav {width:140px;line-height: 24px; list-style-type: none;text-align:left;/*定义整个ul菜单的行高和背景色sh */}
/*==================一级目录===================*/
#nav a {width:140px; display: block;padding-left:40px;/*Width(一定要)，否则下面的Li会变形*/
}#nav li {width:140px; background-image:url(images/left_title.gif); /*一级目录的背景色*/border-bottom:#F7F7F7 1px solid; /*下面的一条白边*/float:left;/*float：left,本不应该设置，但由于在Firefox不能正常显示继承Nav的width,限制宽度，li自动向下延伸*/}
#nav li a:hover{ background-image:url(images/left_title2.gif);	/*一级目录onMouseOver显示的背景色*/}
#nav a:link  {color:#FFF; text-decoration:none;}
#nav a:visited  {color:#FFF;text-decoration:none;}
#nav a:hover  {color:#FFF;text-decoration:none;}
/*==================二级目录===================*/
#nav li ul {list-style:none;text-align:left;}
#nav li ul li{background: #f0f3f4; /*二级目录的背景色*/}
#nav li ul a{ padding-left:40px;width:140px;/* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/}
/*下面是二级目录的链接样式*/
#nav li ul a:link  {color:#000; text-decoration:none;}
#nav li ul a:visited  {color:#000;text-decoration:none;}
#nav li ul a:hover {color:#000;text-decoration:none;font-weight:normal;background:#b7e3f7;/* 二级onmouseover的字体颜色、背景色*/}
/*==============================*/
#nav li:hover ul {left: auto;}
#nav li.sfhover ul {left: auto;}
#content {clear: left; }
#nav ul.collapsed {display: none;}
-->
#PARENT{width:140px;padding-left:0px;}
</style>
</head>
<body>
<div id="PARENT" style="padding-top:5px;">
<ul id="nav">
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">网站管理</a>
	<ul id="ChildMenu1" class="expanded">
  <li><a href="wzsz.asp" target="main">系统管理</a></li>
  <li><a href="xiugai_webset.asp" target="main">网站属性</a></li>
   <li><a href="admin_menu.asp" target="main">菜单管理</a></li>
  <li><a href="admin_manage.asp" target="main">用户管理</a></li>
  <li><a href="Manage_backup.asp" target="main">数据库管理</a></li>
  <li><a href="xiugaimsn.asp" target="main">在线客服设置</a></li>
  <li><a href="ManagePartPic.asp" target="main">上传文件管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">静态生成</a>
	<ul id="ChildMenu2" class="expanded">
        <li><a href="static_html.asp?id=1" target="main">生成首页</a></li>
        <li><a href="static_html.asp?id=2" target="main">生成产品</a></li>
        <li><a href="static_html.asp?id=3" target="main">生成新闻</a></li>
        <li><a href="static_html.asp?id=6" target="main">生成下载</a></li>
        <li><a href="static_html.asp?id=4" target="main">生成案例</a></li>
        <li><a href="static_html.asp?id=5" target="main">生成单页</a></li>
        <li><a href="static_html.asp?id=7" target="main">生成SiteMap</a></li>
        <li><a href="static_html.asp?id=8" target="main">生成网站地图</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu5" onClick="DoMenu('ChildMenu5')">产品管理</a>
	<ul id="ChildMenu5" class="expanded">
        <li><a href="add_shop.asp" target="main">增加产品</a></li>
        <li><a href="admin_shop.asp" target="main">管理产品</a></li>
        <li><a href="shop_fl.asp" target="main">分类管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">单页管理</a>
	<ul id="ChildMenu3" class="expanded">
        <li><a href="add_about.asp" target="main">增加单页</a></li>
        <li><a href="admin_about.asp" target="main">管理单页</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">新闻管理</a>
	<ul id="ChildMenu4" class="expanded">
        <li><a href="add_news.asp" target="main">增加新闻</a></li>
        <li><a href="admin_news.asp" target="main">管理新闻</a></li>
        <li><a href="news_fl.asp" target="main">分类管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu11" onClick="DoMenu('ChildMenu11')">下载管理</a>
	<ul id="ChildMenu11" class="expanded">
        <li><a href="add_download.asp" target="main">增加下载</a></li>
        <li><a href="admin_download.asp" target="main">管理下载</a></li>
        <li><a href="download_fl.asp" target="main">分类管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu6" onClick="DoMenu('ChildMenu6')">案例管理</a>
	<ul id="ChildMenu6" class="expanded">
        <li><a href="add_cases.asp" target="main">增加案例</a></li>
        <li><a href="admin_cases.asp" target="main">管理案例</a></li>
        <li><a href="cases_fl.asp" target="main">分类管理</a></li>
	</ul>
</li>

<li><a href="#Menu=ChildMenu7" onClick="DoMenu('ChildMenu7')">人才管理</a>
	<ul id="ChildMenu7" class="expanded">
        <li><a href="add_zw.asp" target="main">发布职位</a></li>
        <li><a href="admin_zw.asp" target="main">管理职位</a></li>
        <li><a href="Admin_HrManage.asp" target="main">应聘管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu8" onClick="DoMenu('ChildMenu8')">幻灯管理</a>
	<ul id="ChildMenu8" class="expanded">
        <li><a href="add_flash.asp" target="main">增加广告</a></li>
        <li><a href="admin_flash.asp" target="main">管理广告</a></li>
	</ul>
</li>

<li><a href="#Menu=ChildMenu9" onClick="DoMenu('ChildMenu9')">其它管理</a>
	<ul id="ChildMenu9" class="expanded">
        <li><a href="admin_book.asp" target="main">留言管理</a></li>
        <li><a href="admin_dg.asp" target="main">订单管理</a></li>
        <li><a href="admin_link.asp" target="main">友情链接</a></li>
	</ul>
</li>

<li><a href="#Menu=ChildMenu10" onClick="DoMenu('ChildMenu10')">版权信息</a>
	<ul id="ChildMenu10" class="expanded">
<div style="color:#000000;width:140px;padding-left:20px; background-color:#EBEBEB">技术支持：钟若天</div>
<div style="color:#000000;padding-left:20px; background-color:#EBEBEB">lankecms.com</div>
	</ul>
</li>

</ul>
</div>
</body>
</html>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
	var obj = document.getElementById("nav").getElementsByTagName("li");
	
	for (var i=0; i<obj.length; i++) {
		obj[i].onmouseover=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseDown=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseUp=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp("( ?|^)sfhover\b"), "");
		}
	}
}
function DoMenu(emid)
{
	var obj = document.getElementById(emid);	
	obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
	if((LastLeftID!="")&&(emid!=LastLeftID))	//关闭上一个Menu
	{
		document.getElementById(LastLeftID).className = "collapsed";
	}
	LastLeftID = emid;
}
function GetMenuID()
{
	var MenuID="";
	var _paramStr = new String(window.location.href);
	var _sharpPos = _paramStr.indexOf("#");
	
	if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
	{
		_paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
	}
	else
	{
		_paramStr = "";
	}
	
	if (_paramStr.length > 0)
	{
		var _paramArr = _paramStr.split("&");
		if (_paramArr.length>0)
		{
			var _paramKeyVal = _paramArr[0].split("=");
			if (_paramKeyVal.length>0)
			{
				MenuID = _paramKeyVal[1];
			}
		}
		/*
		if (_paramArr.length>0)
		{
			var _arr = new Array(_paramArr.length);
		}
		
		//取所有#后面的，菜单只需用到Menu
		//for (var i = 0; i < _paramArr.length; i++)
		{
			var _paramKeyVal = _paramArr[i].split('=');
			
			if (_paramKeyVal.length>0)
			{
				_arr[_paramKeyVal[0]] = _paramKeyVal[1];
			}		
		}
		*/
	}
	
	if(MenuID!="")
	{
		DoMenu(MenuID)
	}
}
GetMenuID();	//*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
menuFix();
--></script>