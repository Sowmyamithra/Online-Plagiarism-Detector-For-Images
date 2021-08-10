<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength) {
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
String saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
//saveFile = "C:\Users\Dell\OneDrive\Desktop\PROJECT" + saveFile;
out.println(saveFile);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

FileOutputStream fileOut = new FileOutputStream(saveFile);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

%><Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
<% out.println(saveFile);%></td></tr></table>
<%
Connection connection = null;
String connectionURL = "jdbc:postgresql://127.0.0.1:5432/Files";;;
ResultSet rs = null;
PreparedStatement psmnt = null;
FileInputStream fis;
try {
Class.forName("org.postgresql.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "postgres","@Nanna55");
File f = new File(saveFile);
psmnt = connection.prepareStatement("insert into file(file_data) values(?)");
fis = new FileInputStream(f);
psmnt.setBinaryStream(1, (InputStream)fis, (int)(f.length()));
int s = psmnt.executeUpdate();
if(s>0) {
System.out.println("Uploaded successfully !");
}
else {
System.out.println("unsucessfull to upload file.");
}
}
catch(Exception e){e.printStackTrace();}
}
%>
