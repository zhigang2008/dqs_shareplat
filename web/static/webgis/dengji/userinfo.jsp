<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<%
try{
String url="jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=C:\\Tomcat5027\\webapps\\Website\\webgis\\dengji\\userinfo.mdb";
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection(url);
Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

ResultSet rs = st.executeQuery("select id from userinfo");
rs.last();
int no;
if(rs.getRow()!=0){
no=rs.getInt(1);
no++;
}else{no=1;}
rs.close();

request.setCharacterEncoding("gb2312");
String name=request.getParameter("username");
if (name==null)
name="";
String company=request.getParameter("userd");
if (company==null)
company="";
String userjob=request.getParameter("userjob");
if (userjob==null)
userjob="";
String eadress=request.getParameter("eadress");
if (eadress==null)
eadress="";
String yongtu=request.getParameter("yongtu");
if (yongtu==null)
yongtu="";
String geshi=request.getParameter("geshi");
if (geshi==null)
geshi="";
String id=""+no;
out.print(id);
String sql="insert into userinfo values("+id+",'"+name+"','"+company+"','"+userjob+"','"+eadress+"','"+yongtu+"','"+geshi+"')";
st.executeUpdate(sql);
st.close();
con.close();
response.sendRedirect("download.htm");
}
catch (SQLException el)
{
response.sendRedirect("error.htm");
}

%>