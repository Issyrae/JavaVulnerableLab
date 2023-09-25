 <%@ include file="/header.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.cysecurity.cspf.jvl.model.DBConnect"%>
<%@page import="java.sql.Connection"%>

<%
Connection con=new DBConnect().connect(getServletContext().getRealPath("/WEB-INF/config.properties"));
PreparedStatement pstmt = null;
ResultSet rs = null;
if(request.getParameter("delete")!=null)
{
    String user=request.getParameter("user");
    String query = "Delete from users where username=?";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, user);
    pstmt.executeUpdate();
}
%>
<form action="manageusers.jsp" method="POST">
<%
String query = "select * from users where privilege='user'";
pstmt = con.prepareStatement(query);
rs = pstmt.executeQuery();
while(rs.next())
{
    out.print("<input type='radio' name='user' value='"+rs.getString("username")+"'/> "+rs.getString("username")+"<br/>");
}
%>
<br/>
<input type="submit" value="Delete" name="delete"/>

</form>
<br/>
<a href="admin.jsp"> Back to Admin Panel</a>
 <%@ include file="/footer.jsp" %>