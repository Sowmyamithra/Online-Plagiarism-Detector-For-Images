<%@ page language="java" %>
<html>
	<head>
		<title> Login form </title>		
	</head>
	<body>
		<div align ="center">
		<form ENCTYPE="multipart/form-data" ACTION="Download.jsp" METHOD=POST>
         	<table>
            		<tr>
               			<td>Name:</td>
               			<td><input type = "text" name = "name" required></td>
            		</tr>
			<tr>
               			<td>Roll No: </td>
               			<td><input type = "number" name = "num" required></td>
            		</tr>
            		<tr>
               			<td>Choose a file:</td>
               			<td><input type="file" name="file" id = "file"><br></td>
            		</tr>  	  
         	</table>
		<input type = 'submit' value = 'submit'>
      		</form>
     	 	</div>
   	</body>
</html>
