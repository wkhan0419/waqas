
<style type="text/css">

body{
background-image:url('https://imgur.com/p7L8a5E.jpg');
background-size:cover;
height:100%;
}
</style>

</head>

<body>
  
<h3><font color="blue"> Welcome: ${Usersession}</font></h3> 
<h4 align="right"><a href="./BackbtnMangerhome" >Home</a>  &nbsp;| &nbsp;<a href="./logout">logout</a></h4> 
<center>
<h1>MY Requested Asset </h1>
</center>


<%UserBean ub1=(UserBean)session.getAttribute("My_Request_To_Id&MyEmail"); 
String Emailid=ub1.getEmailid();
int supportid=ub1.getSupportid();
%>


	<h4 align="left"><font color="blue"> Your ID: ${user_session}</font></h4> 
	<h4 align="left"><font color="blue"> Your EmailID: <%=Emailid %></font></h4> 
	<h4 align="left"><font color="blue"> Your Support ID:<%=supportid %></font></h4> 


</br>
<%@page import="java.util.ArrayList,com.asset_management.beans.*"%>
<%
ArrayList<RequestBean> ar=(ArrayList<RequestBean>)request.getAttribute("Manager_request");
if(!ar.isEmpty())
{
	
%>	
<table border="1">
<tr><th>RequestID</th><th>ManagerId</th><th>Asset Name</th><th>Requested Date</th><th>Status</th></tr>

<%

for(Object o:ar)
{
	RequestBean ub=null;
if(o instanceof RequestBean)
	ub=(RequestBean)o;
%>
<tr>
<td><%=ub.getRequestid()%></td>
<td><%=ub.getManagerid()%></td>
<td><%=ub.getAssetname()%></td>
<td><%=ub.getRequestdate()%></td>
<% 
										if(ub.getStatus()==3)
										{
										%>									
											<td><h5> <font color="Orange">Pending by Support</font></h5></td>
										<%
										}
										else if(ub.getStatus()==4)
										{%>									
											<td><h5> <font color="Green">Dispatched by Support</font></h5></td>
										<%}
										else if(ub.getStatus()==5)
										{%>									
											<td><h5> <font color="Red">Rejected by Support</font></h5></td>
										<%}

%>
									
									
</tr>

<% 
}
}else
{
	
	%>
	
	
	<h1>You Did'nt Create Any Request Till Now !! </h1>

	<%
	
	
}
%>

</table>
</center>