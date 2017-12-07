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
		strSex = "�j";
	} else {
		strSex = "��";
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	 "http://www.w3.org/TR/html4/sTRict.dTD">
<HTML>
<HEAD>
<TITLE>60���� �����肢</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Windows-31J">
<LINK REL="stylesheet" TYPE="text/css" HREF="./style.css">
<script src="date.js" type="text/javascript"></script>

</HEAD>
<BODY>
	<DIV ID="wrapper">

		<H1>
			<span id="subtitle">60����</span> �����肢
		</H1>

		<!--���ʉ�ʑ傫���摜����-->
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

		<!--���͏��\������-->
		<TABLE width="300" border="1" class="details">
			<TR>
				<TD colspan="2"><%=strName%>

			</TR>
			<TR>
				<TD><%=intYear%>�N <%=intMonth%>�� <%=intDay%>��</TD>
				<TD><%=strSex%></TD>
			</TR>
		</TABLE>

		<!--�肢�ڍו\��-->
		<TABLE class="details">
			<TR>
				<TD>�肢�ڍ�

			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getDetail()%></TD>
			<TR>
		</TABLE>

		<!--�����̂��������\��-->
		<TABLE class="details">
			<TR>
				<TD colspan="3">�����̗ǂ�����</TD>
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
				<TD>���l�F<%=ent.getLover_name()%></TD>
				<TD>�F�l�F<%=ent.getFriend_name()%></TD>
				<TD>�d���F<%=ent.getWork_name()%></TD>
			</TR>
		</TABLE>

		<!--�����̂����������͕\��-->
		<TABLE class="details">
			<TR>
				<TD colspan="2">���l
			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getLover_detail()%></TD>
			<TR>
		</TABLE>
		<TABLE class="details">
			<TR>
				<TD colspan="2">�F�l
			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getFriend_detail()%></TD>
			<TR>
		</TABLE>
		<TABLE class="details">
			<TR>
				<TD colspan="2">�d��
			</TR>
			<TR>
				<TD class="bunnsyou"><%=ent.getWork_detail()%></TD>
			<TR>
		</TABLE>
		<p class="go_tytle">
			<a href="UranaiForm.jsp">TOP�ɖ߂�</a>
		</p>
		<p class="go_top">
			<a href="#">���y�[�W�㕔��</a>
		</p>


	</DIV>
	<!--#wrapper-->

</BODY>
</HTML>
