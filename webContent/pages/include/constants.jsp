<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Timestamp" %>

<%!
    private static final String URL = "jdbc:mysql://localhost/map?useSSL=false";
    private static final String ID = "root";
    private static final String PW = "mysql";
%>
<%
    Class.forName("com.mysql.jdbc.Driver");
%>