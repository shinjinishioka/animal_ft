<%@ page contentType="text/html; charset=Windows-31J"%>
<!DOCTYPE HTML>
<HTML><HEAD>
<TITLE>60分類　動物占い</TITLE>
<META charset="Windows-31J">
<LINK REL="stylesheet" TYPE="text/css" HREF="./UranaiForm.css">
<script src="date.js" type="text/javascript"></script>

</HEAD><BODY onload="dateCheck('year', 'month', 'day')">
<!-- work javascript� when load a window-->
<DIV id="wrapper">

<H1><span id="subtitle">60分類</span>　動物占い</H1>

<FORM ACTION="UranaiResult.jsp" METHOD="post">
	<p>あなたのことを教えてください</p>
	<DIV CLASS="section">
		お名前	<INPUT TYPE="text" NAME="name" SIZE="20" MAXLENGTH="20" value="あなた">
	</DIV>
<p>生年月日
<select name="year" id="year" onchange="dateCheck('year', 'month', 'day')">
  <% for(int i = 1900; i <= 2017; i++){%>
    <option value=<%= i %>><%=i%></option>
      <% if(i ==1980){%>
        <option value=<%=i%> selected="selected"><%=i%></option>
      <%}%>
  <%}%>
</select><label for="year">年</label>
<select name="month" id="month" onchange="dateCheck('year', 'month', 'day')">
<!-- 選択時にjavascript作動-->

  <option value="1" selected="selected">1</option>
  <% for(int j = 2; i <= 12; j++){%>
  <option value=<%=j%>><%=j%></option>
  <%}%>
</select><label for="month">月</label>
<select name="day" id="day" >

</select><label for="day">日</label>
</p>

	<DIV CLASS="section">
		性別<INPUT TYPE="radio" NAME="sex" VALUE="m">男
			<INPUT TYPE="radio" NAME="sex" VALUE="f" checked>女
	</DIV>
	<DIV CLASS="section">
		<INPUT TYPE="submit" VALUE="占う">
	</DIV>
</FORM>
</DIV>
</BODY></HTML>
