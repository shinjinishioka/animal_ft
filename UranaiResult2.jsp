<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="animal_ft.*"%>

<%
request.setCharacterEncoding("Windows-31J");
String strName = request.getParameter("name");
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");
String strDay = request.getParameter("day");
String strSex = request.getParameter("sex");

int intYear= Integer.parseInt(strYear);
int intMonth=Integer.parseInt(strMonth);
int intDay=Integer.parseInt(strDay);
UranaiDAO dao =null;


try{
dao = new UranaiDAO();
}catch(Exception e){
  e.printStackTrace();
}

int kansan_id = dao.kansan(intYear,intMonth,intDay);

UranaiDTO ent = dao.getDetailById(kansan_id,strSex);

if(strSex.equals("m")){
	strSex = "�j";
}else{
	strSex = "��";
}

%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	 "http://www.w3.org/TR/html4/sTRict.dTD">
<HTML><HEAD>
<TITLE>60���ށ@�����肢</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="Windows-31J">
<!--<LINK REL="stylesheet" TYPE="text/css" HREF="./style.css">-->

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$('#wrapper').hide();

  $('li').mouseover(function () {
    $(this).css("background-color","blue");
  });
   $('li').mouseout(function () {
    $(this).css("background-color","#eee");
  });


  $('H1').click(function () {
   $('.uranai').hide();
   $('#wrapper').fadeIn(10000);
  });
  
  $('#tab-menu li').on('click', function(){
    if($(this).not('active')){
      // �^�u���j���[
      $(this).addClass('active').siblings('li').removeClass('active');
      // �^�u�̒��g
      var index = $('#tab-menu li').index(this);
      $('#tab-box div').eq(index).addClass('active').siblings('div').removeClass('active');
    }
  });
});

</script>

</HEAD><BODY>
<H1 class="uranai" ID="result">�肢���ʂ�����</H1>

<DIV ID="wrapper">

<H1 class ="attention">60���ޓ����肢</H1>
<B><%=ent.get60Name()%></B>
<P>

<img src="img/<%=ent.get12Picture()%>"alt="+<%=ent.get12Name()%>
</P>

<TABLE width="300" border="1">
<TR><TD colspan="2"><%=strName%></th></TR>
<TR><TD><%= intYear %>�N�@<%= intMonth %>���@<%= intDay %>��</TD><TD><%=strSex%></TD></TR>
</TABLE>
<TABLE  width="300" border="1">
<!-- <TR><TD colspan="2">�肢�ڍ�</TR>
<TR><TD><%=ent.getDetail()%></TD><TR>-->
<!-- 
</TABLE>
<TABLE width="300" border="1">
<TR><TD colspan="3">�����̗ǂ�����</TD></TR>
<TR><TD><img src="img/i_<%=ent.getLover_picture()%>" alt="<%=ent.getLover_12id()%>"></TD>
<TD><img src="img/i_<%=ent.getFriend_picture()%>" alt="<%=ent.getFriend_12id()%>"></TD>
<TD><img src="img/i_<%=ent.getWork_picture()%>" alt="<%=ent.getWork_12id()%>"></TD></TR>
<TR><TD>���l�F<%=ent.getLover_name()%></TD>
<TD>�F�l�F<%=ent.getFriend_name()%></TD>
<TD>�d���F<%=ent.getWork_name()%></TD></TR>
-->


<ul id="tab-menu">
  <li class="active">�肢�ڍ�</li>
  <li>���l</li>  
  <li>�F�l</li>
  <li>�d��</li>
</ul>

<!-- �^�u�̒��g-->
<div id="tab-box">
  <div class="active"><%=ent.getDetail()%></div>
  <div><%=ent.getLover_detail()%><img src="img/i_<%=ent.getLover_picture()%>" alt="<%=ent.getLover_12id()%>"></div>
  <div><%=ent.getFriend_detail()%><img src="img/i_<%=ent.getFriend_picture()%>" alt="<%=ent.getFriend_12id()%>"></div>
  <div><%=ent.getWork_detail()%><img src="img/i_<%=ent.getWork_picture()%>" alt="<%=ent.getWork_12id()%>"></div>
</div>

<p>TOP�ɖ߂�</p>
<p>���y�[�W�㕔�ւ��ǂ�</p>								
									
<style>
#result{
  padding: 25px;
 text-align: center;
}
/* �^�u���j���[ */
#tab-menu {
  list-style: none;
}
#tab-menu li {
  display: inline-block;
  padding: 5px 25px;
  background: #eee;
}
#tab-menu li.active {
  background: green;
  color: #fff;
}

/* �^�u�̒��g */
#tab-box {
  padding: 25px;
  border: 5px solid #000;
}
#tab-box div {
  display: none;
}
#tab-box div.active {
  display: block;
}
</style>
</DIV><!--#wrapper-->



</BODY></HTML>
