<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="animal_ft.*"%>

<%
	request.setCharacterEncoding("Windows-31J");
	String strName = request.getParameter("name");
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String strDay = request.getParameter("day");
	String strSex = request.getParameter("sex");

	int intYear = Integer.parseInt(strYear);
	int intMonth = Integer.parseInt(strMonth);
	int intDay = Integer.parseInt(strDay);
	UranaiDAO dao = null;

	try {
		dao = new UranaiDAO();
	} catch (Exception e) {
		e.printStackTrace();
	}

	int kansan_id = dao.kansan(intYear, intMonth, intDay);

	UranaiDTO ent = dao.getDetailById(kansan_id, strSex);

	if (strSex.equals("m")) {
		strSex = "男";
	} else {
		strSex = "女";
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	 "http://www.w3.org/TR/html4/sTRict.dTD">
<HTML>
<HEAD>
<TITLE>60分類 動物占い</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Windows-31J">
<LINK REL="stylesheet" TYPE="text/css" HREF="./style.css">
<script src="date.js" type="text/javascript"></script>

</HEAD>
<BODY>
	<DIV ID="wrapper">

		<H1>
			<span id="subtitle">60分類</span> 動物占い
		</H1>

		<!--結果画面大きい画像部分-->
		<TABLE width="100" height="100" border="1" class="photo">
			<tr>
				<td><%=ent.get60Name()%></td>
			</tr>
			<tr>
				<td width="150px" height="150px"><img
					src="img/<%=ent.get12Picture()%>"
					alt="+<%=ent.get12Name()%>" width="400" height="300"></td>
			</tr>
		</TABLE>

		<!--入力情報表示部分-->
		<TABLE width="300" border="1" class="details">
			<TR>
				<TD colspan="2"><%=strName%>

			</TR>
			<TR>
				<TD><%=intYear%>年 <%=intMonth%>月 <%=intDay%>日</TD>
				<TD><%=strSex%></TD>
			</TR>
		</TABLE>

		<!--占い詳細表示-->
		<TABLE class="details">
			<TR>
				<TD>占い詳細

			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getDetail()%></TD>
			<TR>
		</TABLE>

		<!--相性のいい動物表示-->
		<TABLE class="details">
			<TR>
				<TD colspan="3">相性の良い動物</TD>
			</TR>
			<TR>
				<TD><img src="img/i_<%=ent.getLover_picture()%>"
					alt="<%=ent.getLover_12id()%>" width="150" height="150"></TD>
				<TD><img src="img/i_<%=ent.getFriend_picture()%>"
					alt="<%=ent.getFriend_12id()%>" width="150" height="150"></TD>
				<TD><img src="img/i_<%=ent.getWork_picture()%>"
					alt="<%=ent.getWork_12id()%>" width="150" height="150"></TD>
			</TR>
			<TR>
				<TD>恋人：<%=ent.getLover_name()%></TD>
				<TD>友人：<%=ent.getFriend_name()%></TD>
				<TD>仕事：<%=ent.getWork_name()%></TD>
			</TR>
		</TABLE>

		<!--相性のいい動物文章表示-->
		<TABLE class="details">
			<TR>
				<TD colspan="2">恋人
			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getLover_detail()%></TD>
			<TR>
		</TABLE>
		<TABLE class="details">
			<TR>
				<TD colspan="2">友人
			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getFriend_detail()%></TD>
			<TR>
		</TABLE>
		<TABLE class="details">
			<TR>
				<TD colspan="2">仕事
			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getWork_detail()%></TD>
			<TR>
		</TABLE>
		<p class="go_tytle">
			<a href="UranaiForm.jsp">TOPに戻る</a>
		</p>
		<p class="go_top">
			<a href="#">▲ページ上部へ</a>
		</p>


	</DIV>
	<!--#wrapper-->

</BODY>
</HTML>
