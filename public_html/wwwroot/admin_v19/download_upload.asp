<%
  if session("admin")="" then
  response.write "<script>alert('非法操作，请先登陆后再进行操作！');window.location.href='index.asp';</script>"
  end if

  dim server_v1,server_v2
  chkpost=false
  server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
  server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
  If Mid(server_v1,8,Len(server_v2))<>server_v2 then
     Response.Write "<script>alert('警告！你正在从外部提交数据,请立即终止！');window.location.href='http://www.gdnet110.gov.cn/';</SCRIPT>"
	 Response.end
  end If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/style.css" type="text/css" rel="stylesheet" />
<style type="text/css">
<!--
body {
	background-color: #F7F7F7;
	margin-top: 0px;
}
#show{position:absolute; top:-22222px; left:-22222px; overflow:auto}
-->
</style>
<script language="javascript">
<!--
function mysub()
{
document.getElementById("esave").style.visibility="visible";
}
-->
</script>
<script language="javascript">
<!--
var img=null;
var maxfile=500;
function chkimg(inp)
{ if(inp!=""){
    //alert(inp);
    if(img)img.removeNode(true);
    img=document.createElement("img");
    img.attachEvent("onreadystatechange",isimg);
    img.attachEvent("onerror",notimg);
    img.src=inp;}
}
function notimg()
{
    alert("您插入的不是图片(必须为jpg|gif|png|bmp)，请重新选择插入");
}
function isimg()
{   
    show.insertAdjacentElement("BeforeEnd",img);
	var hei=img.offsetHeight;
	var wid=img.offsetWidth;
	var size=Math.round(img.fileSize/1024);
	document.getElementById("show1").innerHTML="图片大小:"+ Math.round(img.fileSize/1024) +"KB,宽度"+ img.offsetWidth +"×高度"+ img.offsetHeight+"预览:<img src='"+document.form1.file1.value+"' width=50 height=20 />";
   // alert("图片大小" +size  +"KB\r图片宽度"+ wid +"\r图片高度"+ hei);
	if( Math.round(img.fileSize/1024)>maxfile)
	{alert("图片大小" + size +"KB,超过最大文件"+maxfile+"KB,请重新选择文件");}
}
// -->
</script>
<title>asp图片无组件上传程序(杜绝上传漏洞)1.0</title></head>
<body>
<form name="myform" method="post" action="download_upfile.asp" enctype="multipart/form-data" >
<div name="esave" id="esave" style="position:absolute; top:30px; left:40px; z-index:10; visibility:hidden">上传中,请稍候...</div>
<input name="back_form" type="hidden" value="myform.img" />
<!--上传成功后将文件路径返回到该文本框中-->
<input style="height: 22px" type="file" name="file1"/>
<input type="submit" name="Submit" value="开始上传" class="button" onClick="javascript:mysub()"><span id="show1"></span><span id="show"></span>
</form>
</body>
</html>