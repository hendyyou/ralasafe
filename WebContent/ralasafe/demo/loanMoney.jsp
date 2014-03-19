<%
/**
 * Copyright (c) 2004-2011 Wang Jinbao(Julian Wong), http://www.ralasafe.com
 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
 */
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator,java.text.SimpleDateFormat"%>
<%@page import="org.ralasafe.demo.LoanMoney"%>
<%@page import="org.ralasafe.WebRalasafe"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" media="screen" href="../css/ralasafe.css" />
<title>Loan Money</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<%
Collection loanMoneyList = (Collection) request.getAttribute("loanMoneyList");
SimpleDateFormat sdf=new SimpleDateFormat( "yyyy-MM-dd" );
%>

<div class="smallContainer">

<h1>Loan Money</h1>
<%String denyReason=WebRalasafe.getDenyReason(request);
	if ( denyReason!= null) { %>
<p><font color="red"><%=denyReason%></font></p>
<% } %>

<p>
<font color="green">Ralsafe can control the data you submit to system</font>
</p>

<form id="appForm" method="post" action="loanMoney" />
<input type="hidden" name="op" value="add" />
<label>Input money amount</label>
<input type="text" name="money" />
<br/>
<input type="submit" />&nbsp;&nbsp;
<input type="button" value="Back" onclick="javascript: window.history.go(-1)" />
</form>

<p>&nbsp;</p>
<p>&nbsp;</p>


<h2>Today load money records</h2>
<table class="ralaTable">
	<thead>
		<tr>
			<th>Date</th>
			<th>Amout</th>
		</tr>
	</thead>
	<tbody>
		<%
			for (Iterator iter = loanMoneyList.iterator(); iter.hasNext();) {
				LoanMoney entry = (LoanMoney) iter.next();
		%>

		<tr>
			<td><%=sdf.format(entry.getLoanDate())%></td>
			<td><%=entry.getMoney()%></td>
		</tr>
		<%
			}
		%>
		</tbdoy>
</table>

</div>
<jsp:include page="../footer.jsp" />


</body>
</html>
