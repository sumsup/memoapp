<%-- 카테고리 설정 페이지 --%>
<%@ page language="java" session="false" pageEncoding="UTF-8" contentType="text/html" %>
<%@ include file="include/constants.jsp" %>
<jsp:include page='include/header.jsp' />
<%!
    private String category = null; // 카테고리 목록용.
    private Timestamp createdAt = null;
    private String categoryAdd = null; // 카테고리 추가용.
    private int writerId = 0;
%>
<form action='setCategory.jsp' method='post'>
    <input type='hidden' name='writerId' id='writerId' value='1'>
    <p>카테고리 : <input type='text' name='categoryAdd' id='categoryAdd'> </p>
    <button type='submit'>등록</button>
</form>
<hr>
<%-- 카테고리를 추가하고. --%>
<%
    request.setCharacterEncoding("utf-8");

    categoryAdd = request.getParameter("categoryAdd");
    if (request.getParameter("writerId") != null) {
        writerId = Integer.parseInt(request.getParameter("writerId"));
    }

    if (categoryAdd != null) {

        try(Connection conn = DriverManager.getConnection(URL, ID, PW)) {
            String insertCategoryQuery = "insert into category (writer_id, category) values (" + writerId + ", '" + categoryAdd + "')";

            try(Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(insertCategoryQuery);
            } catch(SQLException e) {
                System.out.println("category insert SQL exception : " + e);
            }
            System.out.println("category insert success** : " + categoryAdd);
        } catch(Exception e) {
            System.out.println("connection exception : " + e);
        }
    }

%>

<%-- 현재 카테고리 목록을 불러오고. --%>
<%
    try(Connection conn = DriverManager.getConnection(URL, ID, PW)) {
        String selectCategoryQuery = "SELECT * FROM category order by created_at desc";

        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(selectCategoryQuery);
            while (rs.next()) {
                category = rs.getString("category");
                createdAt = rs.getTimestamp("created_at");
                %>

                <div>
                <p> 카테고리 : <%= category %> </p>
                <p> 생성일 : <%= createdAt %> </p>
                </div>
                <hr>

                <%
            }
        } catch(SQLException e) {
            System.out.println("SQLException : " + e);
        }
    } catch(Exception e) {
        System.out.println("Exception : " + e);
    }

%>

<%-- 카테고리를 변경하고. --%>





<%-- 카테고리를 삭제하고. --%>


