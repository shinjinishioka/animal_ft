<%@ page contentType="text/html; charset=Windows-31J"%>
<!DOCTYPE HTML>
<HTML><HEAD>
<TITLE>60���ށ@�����肢</TITLE>
<META charset="Windows-31J">
<LINK REL="stylesheet" TYPE="text/css" HREF="./UranaiForm.css">
<script src="date.js" type="text/javascript"></script>

</HEAD><BODY onload="dateCheck('year', 'month', 'day')">
<!-- work javascript� when load a window-->
<DIV id="wrapper">

<H1><span id="subtitle">60����</span>�@�����肢</H1>

<FORM ACTION="UranaiResult.jsp" METHOD="post">
	<p>���Ȃ��̂��Ƃ������Ă�������</p>
	<DIV CLASS="section">
		�����O	<INPUT TYPE="text" NAME="name" SIZE="20" MAXLENGTH="20" value="���Ȃ�">
	</DIV>
<p>���N����
<select name="year" id="year" onchange="dateCheck('year', 'month', 'day')">
  <% for(int i = 1900; i <= 2017; i++){%>
    <option value=<%= i %>><%=i%></option>
      <% if(i ==1980){%>
        <option value=<%=i%> selected="selected"><%=i%></option>
      <%}%>
  <%}%>
</select><label for="year">�N</label>
<select name="month" id="month" onchange="dateCheck('year', 'month', 'day')">
<!-- �I������javascript�쓮-->

  <option value="1" selected="selected">1</option>
  <% for(int j = 2; i <= 12; j++){%>
  <option value=<%=j%>><%=j%></option>
  <%}%>
</select><label for="month">��</label>
<select name="day" id="day" >

</select><label for="day">��</label>
</p>

	<DIV CLASS="section">
		����<INPUT TYPE="radio" NAME="sex" VALUE="m">�j
			<INPUT TYPE="radio" NAME="sex" VALUE="f" checked>��
	</DIV>
	<DIV CLASS="section">
		<INPUT TYPE="submit" VALUE="�肤">
	</DIV>
</FORM>
</DIV>
</BODY></HTML>
