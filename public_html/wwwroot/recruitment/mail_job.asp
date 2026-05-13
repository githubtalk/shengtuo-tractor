<!--#include file="../Inc/utf-8.asp"-->
<!--#include file="../Inc/sql.asp"-->
<!--#include file="../Inc/conn.asp"-->
<!--#include file="../Inc/config.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Recruitment-<%=config("title")%></title>
<meta name="keywords" content="<%=config("keywords")%>" />
<meta name="description" content="<%=config("description")%>" />
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<!--[if lte IE 6]>
<script src="../js/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div,img');
    </script>
<![endif]-->
<SCRIPT language=javaScript>
function CheckJob()
{
	if (document.form1.Quarters.value.length < 2 || document.form1.Quarters.value.length > 30){
		alert ("Position in 2-30 words must be in between!");
		document.form1.Quarters.focus();
		return false;
	}
	if (document.form1.Name.value.length < 2 || document.form1.Name.value.length > 16){
		alert ("The name must in 2-16 words!");
		document.form1.Name.focus();
		return false;
	}
	if (document.form1.Edulevel.value.length < 20 ){
		alert ("Education experience must be in at least 45 words!");
		document.form1.Edulevel.focus();
		return false;
	}
	if (document.form1.Experience.value.length < 20 ){
		alert ("Working experience in more than 20 words must be!");
		document.form1.Experience.focus();
		return false;
	}

    if(document.form1.Email.value.length!=0)
     {
       if (document.form1.Email.value.charAt(0)=="." ||        
            document.form1.Email.value.charAt(0)=="@"||       
            document.form1.Email.value.indexOf('@', 0) == -1 || 
            document.form1.Email.value.indexOf('.', 0) == -1 || 
            document.form1.Email.value.lastIndexOf("@")==document.form1.Email.value.length-1 || 
            document.form1.Email.value.lastIndexOf(".")==document.form1.Email.value.length-1)
        {
         alert("Email Format is not correct!");
         document.form1.Email.focus();
         return false;
         }
      }
    else
     {
      alert("Email Can't for empty!");
      document.form1.Email.focus();
      return false;
      }
 }
</SCRIPT>
</head>
<body>
<div id="main">

<div id="translate">
    <!-- Begin TranslateThis Button -->
    <div id="translate-this"><a style="width:180px;height:18px;display:block;" class="translate-this-button" href="http://www.translatecompany.com/"></a></div>
    <script type="text/javascript" src="http://x.translateth.is/translate-this.js"></script>
    <script type="text/javascript">
    TranslateThis();
    </script>
    <!-- End TranslateThis Button -->
</div>

<!--#include file="../Inc/header.asp" -->

<div id="center">

<!--#include file="../Inc/left.asp"-->
    
    <div id="right">   
        <div class="category_title">Your position：<a href="<%=root%>/index.html">Home</a> > Recruitment</div>
<table width="710" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f4f4f2">
  <tr>
    <td width="710" valign="top"><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      <TBODY>
        
        <TR>
          <TD><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR>
                  <TD width="100%"><table width="100%" height="140%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="206" valign="top">
		<%
        dim zw
        zw = request.QueryString("zw")
        %>
        <%
        function ChangeChr(str) 
        ChangeChr=replace(replace(replace(replace(str,"<","&lt;"),">","&gt;"),chr(13),"<br>")," ","&nbsp;") 
        end function
        %>
        <%    
        dim action,Quarters
        Quarters=trim(request.QueryString("Quarters"))
        action=trim(request.QueryString("action"))
               
        if action="add" then   
           Quarters=ChangeChr(trim(request.Form("Quarters")))
           Uname=ChangeChr(trim(request.Form("Name")))
           Sex=ChangeChr(trim(request.Form("Sex")))
           Marry=ChangeChr(trim(request.Form("Marry")))
           Birthday=ChangeChr(trim(request.Form("Birthday")))
           Stature=ChangeChr(trim(request.Form("Stature")))
           School=ChangeChr(trim(request.Form("School")))
           Studydegree=ChangeChr(trim(request.Form("Studydegree")))
           Specialty=ChangeChr(trim(request.Form("Specialty")))
           Gradyear=ChangeChr(trim(request.Form("Gradyear")))	
           Residence=ChangeChr(trim(request.Form("Residence")))
           Edulevel=trim(request.Form("Edulevel"))
           Edulevel=trim(ChangeChr(Edulevel))
           Experience=trim(request.Form("Experience"))
           Experience=trim(ChangeChr(Experience))
           Phone=ChangeChr(trim(request.Form("Phone")))
           Mobile=ChangeChr(trim(request.Form("Mobile")))
           Email=ChangeChr(trim(request.Form("Email")))
           Add=ChangeChr(trim(request.Form("Add")))
           Postcode=ChangeChr(trim(request.Form("Postcode")))
           
           if School="" then
            School=null
           end if
           if Studydegree="" then
            Studydegree=null
           end if
           if Specialty="" then
            Specialty=null
           end if
           if Gradyear="" then
            Gradyear=null
           end if
           if Mobile="" then
            Mobile=null
           end if
           if Add="" then
            Add=null
           end if
           if Postcode="" then
            Postcode=null
           end if
         '=================================   
           set rs=server.createobject("adodb.recordset")
               sql="select * from HrDemandAccept where (id is null)" 
               rs.open sql,conn,1,3
               rs.addnew
               rs("Quarters")=Quarters
               rs("name")=Uname	 
               rs("Sex")=Sex	 
               rs("Marry")=Marry
               rs("Birthday")=Birthday
               rs("Stature")=Stature	
               rs("School")=School
               rs("Studydegree")=Studydegree
               rs("Specialty")=Specialty
               rs("Gradyear")=Gradyear   
               rs("Residence")=Residence	  
               rs("Edulevel")=Edulevel
               rs("Experience")=Experience
               rs("Phone")=Phone
               rs("Mobile")=Mobile
               rs("Email")=Email
               rs("Add")=Add
               rs("Postcode")=Postcode
               rs("Adddate")=date()
               rs.update
               rs.close
               set rs=nothing
        response.write"<SCRIPT language=JavaScript>alert('Your resume submitted to succeed, if applicable, we will inform you as soon as the interview!');"
        response.write"javascript:history.go(-2)</SCRIPT>"       
        else
        %>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr valign="top" >
              <td  width="80%" height="18"><form action="email_job.asp?action=add" method="post" name="form1" id="form1" onSubmit="return CheckJob()">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><div align="center"></div></td>
                    </tr>
                  </table>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC" >
                    <tr bgcolor="#f7f7f6">
                      <%Quarters=request("Quarters")%>
                      <td width="86" height="30"><div align="right"><font color="#000066">Position:
                      </font></div></td>
                      <td width="569" height="25">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <input   name="Quarters"  id="jobname" value="<%=zw%>"  size="36" />
                        * </td>
                    </tr>
                    <tr bgcolor="#f7f7f6">
                      <td width="86"><div align="right"><font color="#000066">Personal data:</font></div></td>
                      <td valign="top"><table width="528" border="0" cellpadding="2" cellspacing="1">
                          <tbody>
                            <tr>
                              <td width="17%" height="20" align="right">Name:</td>
                              <td width="83%"><input  name="Name" />
                                * </td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Sex:</td>
                              <td><select id="Sex" name="Sex">
                                  <option value="男" selected="selected">man</option>
                                  <option value="女">woman</option>
                                </select>
                                *</td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Marital status:</td>
                              <td><select id="Marry"   name="Marry">
                                  <option value="未婚"  selected="selected">unmarried</option>
                                  <option  value="已婚">married</option>
                                </select>                              </td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Birthday:</td>
                              <td><input name="Birthday" />
                              </td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Stature:</td>
                              <td><input name="Stature" id="stature" size="15" maxlength="3" />
                              </td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">School:</td>
                              <td><input name="School" size="40" /></td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Education:</td>
                              <td><input name="Studydegree" size="30" maxlength="50" /></td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Specialty:</td>
                              <td><input name="Specialty" size="30" maxlength="50" /></td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Graduation time:</td>
                              <td><input name="Gradyear" size="16" /></td>
                            </tr>
                            <tr>
                              <td align="right" 
                                height="20">Residence:</td>
                              <td><input 
                                name="Residence" id="Residence" 
                                size="40" maxlength="50" />
                                *</td>
                            </tr>
                          </tbody>
                      </table></td>
                    </tr>
                    <tr>
                      <td width="86" bgcolor="#f7f7f6"><div align="right"><font color="#000066">Education experience:</font></div></td>
                      <td align="center" bgcolor="#f7f7f6"><table width="100%" height="188" 
                                border="0" align="center" cellpadding="2" cellspacing="1">
                          <tbody>
                            <tr bgcolor="#f7f7f6">
                              <td width="16%" height="21" align="center">&nbsp;degree:</td>
                              <td width="22%" align="center">&nbsp;Start-stop time:</td>
                              <td width="22%" align="center">&nbsp;Professional:</td>
                              <td width="19%" align="center">&nbsp;certificate:</td>

                              <td width="21%">&nbsp;School:</td>
                            </tr>
                            <tr valign="top" bgcolor="#f7f7f6">
                              <td colspan="5" align="center"><textarea id="Edulevel" name="Edulevel" rows="12" cols="65"></textarea>
                                  <br /></td>
                            </tr>
                          </tbody>
                      </table></td>
                    </tr>
                    <tr>
                      <td width="86" bgcolor="#f7f7f6"><div align="right"><font color="#000066">Work experience:</font></div></td>
                      <td bgcolor="#f7f7f6"><table width="100%" height="188" 
                                border="0" align="center" cellpadding="2" cellspacing="1">
                          <tbody>
                            <tr bgcolor="#f7f7f6">
                              <td width="25%" height="21" align="center">&nbsp;Start-stop time:</td>
                              <td width="25%" align="center">&nbsp;position:</td>
                              <td width="25%" align="center">&nbsp;unit:</td>
                              <td width="25%">&nbsp;Job content:</td>
                            </tr>
                            <tr valign="top" bgcolor="#f7f7f6">
                              <td colspan="4" align="center"><textarea id="Experience" name="Experience" rows="12" cols="65"></textarea>
                                  <br /></td>
                            </tr>
                          </tbody>
                      </table></td>
                    </tr>
                    <tr bgcolor="#f7f7f6">
                      <td width="86"><div align="right"><font color="#000066">contact:</font> </div></td>
                      <td><table width="500" border="0" cellpadding="2" cellspacing="1">
                          <tbody>
                            <tr>
                              <td width="17%" height="20" align="right">Tel：</td>
                              <td width="83%"><input name="Phone" id="Phone" size="25" />
                                * </td>
                            </tr>
                            <tr>
                              <td 
                                height="20" align="right">Mobile:</td>
                              <td><input 
                                name="Mobile" id="Mobile" size="25" />                              </td>
                            </tr>
                            <tr>
                              <td 
                                height="20" align="right">E-mail:</td>
                              <td><input 
                                name="Email" id="Email" size="25" />
                                *</td>
                            </tr>
                            <tr>
                              <td 
                                height="20" align="right">Add:</td>
                              <td><input name="Add" id="Add" 
                               size="40" /></td>
                            </tr>
                            <tr>
                              <td 
                                height="20" align="right">Postcode:</td>
                              <td><input 
                                name="Postcode" id="Postcode" size="10" maxlength="6" /></td>
                            </tr>
                          </tbody>
                      </table></td>
                    </tr>
                    <tr bgcolor="#f7f7f6">
                      <td width="86">&nbsp;</td>
                      <td><div align="center">
                          <input type="submit" name="submit8" value="Submit">
                        &nbsp;&nbsp;
                        <input type="reset" name="Submit8" value="Reset" />
                      </div></td>
                    </tr>
                  </table>
              </form></td>
            </tr>
          </table>
        <% end if %>      </td>
    </tr>
  </table></TD>
                </TR>
            </TABLE></TD>
        </TR>
    </TABLE></td>
  </tr>
</table>
        
    </div>
    <!-- end of right -->
    
</div>
<!-- end of center -->

</div>
<!-- end of main -->

<!--#include file="../Inc/foot.asp" -->
</body>
</html>