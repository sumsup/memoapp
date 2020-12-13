<%@ page language="java" session="false" pageEncoding="UTF-8" contentType="text/html" %>
<%@ include file="include/constants.jsp" %>
<jsp:include page='include/header.jsp' />
<%!    
    private int id = 0;
    private String email = null;
    private String password = null;
    private String nickname = null;
    private String sex = null;
    private String birthday = null;
    private String submitFlag = null;
%>
<p> - 가입자 목록 - </p>
<%  
    request.setCharacterEncoding("utf-8");

    try(Connection conn = DriverManager.getConnection(URL, ID, PW)) {
        // Class.forName("com.mysql.jdbc.Driver");

        System.out.println("연결성공!");
        
        String selectWriterQuery = "select * from writer";
        String showTablesQuery = "show tables";

        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(selectWriterQuery);
            while (rs.next()) {
                id = rs.getInt("id");
                email = rs.getString("email");
                password = rs.getString("password");
                nickname = rs.getString("nickname");
                sex = rs.getString("sex");
                birthday =  rs.getString("birthday");
                %>
                <p>
                <%= id %>
                <%= email %>
                <%= password %>
                <%= nickname %>
                <%= sex %>
                <%= birthday %>
                </p>
                <%
                System.out.println("id : " + id);
                System.out.println("email : " + email);
                System.out.println("password : " + password);
                System.out.println("nickname : " + nickname);
                System.out.println("sex : " + sex);
                System.out.println("birthday : " + birthday + "\n");
            }

            ResultSet rs2 = stmt.executeQuery(showTablesQuery);
            while(rs2.next()) {
                System.out.println("tables : " + rs2.getString(1));
            }
            
        } catch (Exception e) {
            //TODO: handle exception
        }
    }
    // catch(ClassNotFoundException e) {
    //     System.out.println("connect fail!");
    //     System.out.println("exception : " + e);
    // }
    catch(SQLException e) {
        System.out.println("exception : " + e);
    }

%>