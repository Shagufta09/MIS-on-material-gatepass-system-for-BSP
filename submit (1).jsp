<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>

<%
    String docType = request.getParameter("DOC_TYPE");
    String movementType = request.getParameter("MOVEMENT_TYPE");
    String dateFrom = request.getParameter("DATE_FROM");
    String dateTo = request.getParameter("DATE_TO");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SYSTEM", "ADMIN");
        stmt = conn.createStatement();
        String query = "SELECT g.DOCNO, g.DOC_TYPE, g.VEH_ENTRY_DT, g.MOVEMENT_TYPE, a.REQNO " +
                       "FROM MGP_GATEPASS g " +
                       "JOIN MGP_GATEPASS_APPROVAL a ON g.DOCNO = a.DOCNO " +
                       "WHERE g.DOC_TYPE = '" + docType + "' " +
                       "AND g.MOVEMENT_TYPE = '" + movementType + "' " +
                       "AND g.VEH_ENTRY_DT BETWEEN TO_DATE('" + dateFrom + "', 'YYYY-MM-DD') " +
                       "AND TO_DATE('" + dateTo + "', 'YYYY-MM-DD')";
					   out.print(query);
        rs = stmt.executeQuery(query);
		if(rs.next())
			out.print("hi");
%>
        <table border="1">
            <tr>
                <th>DOCNO</th>
                <th>DOC_TYPE</th>
                <th>VEH_ENTRY_DT</th>
                <th>MOVEMENT_TYPE</th>
                <th>REQNO</th>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("DOCNO") %></td>
                <td><%= rs.getString("DOC_TYPE") %></td>
                <td><%= rs.getString("VEH_ENTRY_DT") %></td>
                <td><%= rs.getString("MOVEMENT_TYPE") %></td>
                <td><%= rs.getString("REQNO") %></td>
            </tr>
<%
        }
%>
        </table>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
