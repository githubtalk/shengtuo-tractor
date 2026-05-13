<%
Sql_in="and |or |on |in |select |insert |update |delete |exec |declare |'"
  '防止GET方法--------------------------------------------------------
  '区分出注入字符
  Sql=Split(Sql_in,"|") 
  '如果GET过来的数据不为空
  If Request.QueryString<>"" Then
      '逐一取出提交过来的参数
     For Each Sql_Get In Request.QueryString
     For Sql_Data=0 To Ubound(Sql)
      '判断是否包含非法字符
      IF Instr(Lcase(Request.QueryString(Sql_Get)),Sql(Sql_Data))<>0 Then
       '如果有非法字符，弹出对话框提示，并自动返回上一页
       Response.Write("<script>alert('系统提示：请不要输入非法字符尝试注入↓，你的IP已记录!');history.go(-1);</script>")
    Response.End()
   End IF
   Next
   Next
   End If
  '防止POST方法---------------------------------------------------
  IF Request.Form<>"" Then
     For Each Sql_Post In Request.Form
    For Sql_Data=0 To Ubound(Sql)
     IF Instr(Lcase(Request.Form(Sql_Post)),Sql(Sql_Data))<>0 Then
        Response.Write("<script>alert('系统提示：请不要输入非法字符尝试注入↓你的IP已记录!');history.go(-1);</script>")
     Response.End()
     End IF
  Next
  Next
  End if
  '-----------------------------------------------------------
%>