<%-- 메모 목록 페이지. --%>
<%@ page language="java" session="false" pageEncoding="UTF-8" contentType="text/html" %>
<%@ include file="include/constants.jsp" %>
<jsp:include page='include/header.jsp' />

<div>
    <form action='setMemo.jsp' method='post'>
        <%-- writer id를 로그인 세션에서 가져와서 넣어줘야 될 듯? --%>
        <input type='hidden' id='writer' name='writer' value=''>
        <%-- 카테고리는 나중에 별도 편집 페이지 만들고. 여기에서는 셀렉트 박스 만들어서 선택만 가능하게. --%>
        메모 : <textarea id='writeMemo' name='writeMemo' rows='20' cols='50'></textarea>
        <button type='submit'>등록</button>
    </form>
</div>
<hr>

<%!
    private int id = 0;
    private String memo = null;
    private String nickname = null;
    private Date createdAt = null;
    private Timestamp createdAtTimestamp = null;
    private String writeMemo = null;
    private int startPageNum = 0;
    private static final int offset = 5;
    // 일단은 writer id 는 기존의 것을 하드코딩해서 박도록 하자.
    private int writerId = 1;
    private int pageVolume;
%>
    
<%
    request.setCharacterEncoding("utf-8");

    if(request.getParameter("pageNum") != null) {
        startPageNum =  (Integer.parseInt(request.getParameter("pageNum")) - 1) * 5;
    }

    try(Connection conn = DriverManager.getConnection(URL, ID, PW)) {
        String selectMemoQuery = "SELECT a.id, memo, created_at, nickname FROM memo a INNER JOIN writer "
                           + "b ON a.writer_id = b.id order by created_at desc limit " + startPageNum + ", "+offset;

        String countPaging = "select count(*) from memo";
        
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(selectMemoQuery);

            while (rs.next()) {
                id = rs.getInt("id");
                nickname = rs.getString("nickname");
                memo = rs.getString("memo");
                createdAtTimestamp = rs.getTimestamp("created_at");
                createdAt = rs.getDate("created_at");

            %>
            <div>
            <p> 아이디 : <%= id %> </p>
            <p> 닉네임 : <%= nickname %> </p>
            <p> 메모 : <%= memo %> </p>
            <p> 작성일 : <%= createdAt %> </p>
            <p> 작성시각 : <%= createdAtTimestamp %> </p>
            <hr>
            </div>
            <%
                System.out.println("nickname : " + nickname);
                System.out.println("memo : " + memo);
                System.out.println("createdAtTimestamp : " + createdAtTimestamp);
                System.out.println("createdAt : " + createdAt);
            }
            ResultSet count = stmt.executeQuery(countPaging);
            while (count.next()) {
                pageVolume = count.getInt(1);
                if (pageVolume % offset != 0) {
                    pageVolume /= offset;
                    pageVolume++;
                }
                System.out.println("total 게시물 수 : " + pageVolume);
            }
            
        }

    } catch (SQLException e) {
        System.out.println("exception : " + e);
    }

%>
        <p>페이지</p>
<%
    for (int i = 0 ; i < pageVolume; i++) {
        %>
        <a href='/map/setMemo.jsp?pageNum=<%=i+1%>'><%=i+1%></a>
        <%
    }
%>
<hr>
<%
    request.setCharacterEncoding("utf-8");
    writeMemo = request.getParameter("writeMemo");

    if(writeMemo != null) {

        try(Connection conn = DriverManager.getConnection(URL, ID, PW)) {
            String insertQuery = "insert into memo (writer_id, memo) value ('" + writerId + "','" + writeMemo + "')";

            try(Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(insertQuery);
            } catch(Throwable e) {
                System.out.println("insert QUERY exception : " + e);
            }
            System.out.println("등록 성공!!");

        } catch(SQLException e) {
            System.out.println("exception : " + e);
        }

        response.sendRedirect("setMemo.jsp");
    }

%>
