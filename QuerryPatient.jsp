<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">  
table {  
    border: 2px #CCCCCC solid;  
    width: 600px;  
}  
  
td,th {  
    height: 80px;  
    border: #CCCCCC 1px solid;  
}  
</style>
</head>
<body>
	<%
		Connection con = null;
		Statement sql = null;
		ResultSet rs = null;
		//获得最大编号
		int id = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e){
			e.printStackTrace();
			out.print(e.toString());
		}
		try{
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","gljProject","glj123");
		} catch(SQLException e){
			e.printStackTrace();
			out.print(e.toString());
		}
		
		String findSQL = "SELECT * FROM PATIENT";
		PreparedStatement pstmt = con.prepareStatement(findSQL);
		rs=pstmt.executeQuery();
	%>
	<h1 align="center">查询病人信息</h1>
	<table align="center">
		<tr>
             <th>
               <%
                 out.print("病人号");
                %>
             </th>
             <th>
               <%
                 out.print("病人姓名");
                %>
             </th>
             <th>
               <%
                 out.print("病人年龄");
                %>
             </th>
             <th>
               <%
                 out.print("病人性别");
                %>
             </th>
             <th>
               <%
                 out.print("病人电话");
                %>
             </th>
             <th>
               <%
                 out.print("病人住址");
                %>
             </th>
             <th>
               <%
                 out.print("病人病历");
                %>
             </th>
          </tr>
        <%  
            while (rs.next()) {  
        %>  
        <tr>  
            <td>  
                <%  
                    out.print(rs.getInt(1));                  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(2));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getInt(3));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(4));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(5));  
                %>  
            </td> 
            <td>  
                <%  
                    out.print(rs.getString(6));  
                %>  
            </td> 
            <td>  
                <%  
                    out.print(rs.getString(7));  
                %>  
            </td> 
        </tr>  
        <%  
            }  
        %>
	</table>
</body>
</html>