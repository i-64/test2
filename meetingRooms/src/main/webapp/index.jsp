<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isELIgnored="false" %>

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html>

<html>

<head>

	<meta charset="utf-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">	
	
	<link href="css/Footer-with-button-logo.css" rel="stylesheet">
	
	<script src="javaScript/bootstrap_v4.5.2.js"></script>
	<script src="javaScript/jQuery_v3.5.1.js"></script>
	

	<title> Home Page </title>

</head>

<body>

<!-- NAVBAR -->


<div class="container">

	<nav class="navbar navbar-inverse navbar-fixed-top">
	
		<div class="container-fluid">
	    	
	    	<div class="navbar-header">
	    	
	      		<a class="navbar-brand" href="index.jsp"> <img src="images/logo/hsbc-logo-dark_navbar.png"  style=" height:20px; width:110px;"/> </a>
	      		
	    	</div>
	    	
	    	<ul class="nav navbar-nav">
	      	
	      		<li class="active"> <a href="index.jsp"> Home </a> </li>
	      	
	      		<li> <a href="#"> Import Users </a> </li>
	      		
	      		<% if ( session.getAttribute ( "role" ) == null ) { %>
                    
                <li> <a href="login.jsp"> Login </a> </li>
                    
                <% } else { %>
                    
                <li> <a href="Logout"> Logout </a> </li>
                    
                <% } %>	      		
	      		
	    	</ul>
	    	
	  	</div>

	</nav>

</div>

<!-- NAVBAR -->

<div class="row"> <br> <br> <br> </div>

${home_page_message}

<!-- DISPLAY MEETING LISTS -->



<%
	try {
		
		// load driver
		
		Class.forName ( "org.apache.derby.jdbc.EmbeddedDriver" );
					
		// get connection to database
					
		Connection con = DriverManager.getConnection ( "jdbc:derby:c:/database/meetingRoomsDB", "admin", "admin" );
		
		// prepare query
		
		PreparedStatement ps = con.prepareStatement ( "select * from meeting_room" );
		
		ResultSet set_1 = ps.executeQuery ();		
%>
		
<div class="container">

  <h2> Meetings </h2>
          
  <table class="table table-striped table-hover">
  
    <thead>
    
      <tr>
      
        <th> Meeting Room Name </th>
        <th> Seating Capacity </th>
        <th> Total Meeting Conducted </th>
        <th> Rating ( out of 5 ) </th>
        
      </tr>
      
    </thead>
    
    <tbody>
    
<%
		while ( set_1.next () ) {

%>
			<tr>
			
			   <td> <%=set_1.getString (1)%> </td>
			   <td> <%=set_1.getString (2)%> </td>
			   <td> 0 </td>
			   <td> 0 </td>
			 
			</tr>
			
<%			
		}

	} catch ( SQLException | ClassNotFoundException e ) {
	
		e.printStackTrace ();
	}

%>
  

      
    </tbody>
    
  </table>
  
</div>

<!-- DISPLAY MEETING LISTS -->


<!-- Footer -->

<div class="content"> </div>
    
<footer id="myFooter">

    <div class="container">
        
        <div class="row">
            
            <div class="col-sm-3">
            
                <h2 class="logo"> <a href="index.jsp"> <img src="images/logo/hsbc-logo-dark_2.png" style=" height:70px; width:150px;"  align="left"/> </a> </h2>
                
            </div>
            
            <div class="col-sm-2">
                
                <h5> Get started </h5>
                
                <ul>
                
                    <li> <a href="index.jsp"> Home </a> </li>
                    
                    <% if ( session.getAttribute ( "role" ) == null ) { %>
                    
                    <li> <a href="login.jsp"> Login </a> </li>
                    
                    <% } else { %>
                    
                    <li> <a href="Logout"> Logout </a> </li>
                    
                    <% } %>
                    
                </ul>
                
            </div>
            
            <div class="col-sm-2">
            
                <h5>About us</h5>
                
                <ul>
                
                    <li> <a href="#"> Information </a> </li>
                    
                    <li> <a href="#"> Give Feedback </a> </li>
                    
                </ul>
                
            </div>
            
            <div class="col-sm-2">
            
                <h5> Support </h5>
                
                <ul>
                
                    <li> <a href="#"> FAQ </a> </li>
                    
                    <li> <a href="#"> Help desk </a> </li>
                    
                </ul>
                
            </div>
            
            <div class="col-sm-3">
            
            	<br>
            
             <a href = "#"> <button type="button" class="btn" > Contact us </button> </a>	                
         
         </div>
            
        </div>
        
    </div>
    
    <div class="footer-copyright">
    
        <p> Developed By WFS BATCH-1 @ HSBC-CodeFury </p>
        
    </div>
    
</footer>

<!-- Footer -->



</body>

</html>
