<%@ page language="java" session="false" pageEncoding="UTF-8" contentType="text/html" %>
<%@ include file="include/constants.jsp" %>
<jsp:include page='include/header.jsp' />

<form action='joinWriter.jsp' method='post'>
<p> - 회원 가입 - </p>
<p> 이메일 : <input type='text' id='email' name='email' placeholder='ex) ironman@gmail.com'> </p>
<p> 비밀번호 : <input type='password' id='password' name='password' placeholder='ex) qwer1234'> </p>
<p> 닉네임 : <input type='text' id='nickname' name='nickname' placeholder='ex) 어벤저스'> </p>
<p> 성별 - 남<input type='radio' id='sex_man' name='sex' value='M'> 여<input type='radio' id='sex_woman' name='sex' value='W'> </p>
<p> 생년월일 : <input type='text' id='year' name='year' placeholder='ex) 1986'> 년 <input type='text' id='month' name='month' placeholder='ex) 02'> 
    월 <input type='text' id='day' name='day' placeholder='ex) 15'> 일 </p>
    <input type='hidden' id='submitFlag' name='submitFlag' value='true'>
    <button type='submit'>등록</button>
</form>
<%!
    
    private int id = 0;
    private String email = null;
    private String password = null;
    private String nickname = null;
    private String sex = null;
    private String birthday = null;
    private String submitFlag = null;
%>
<%
    request.setCharacterEncoding("utf-8");

    email = request.getParameter("email");
    password = request.getParameter("password");
    nickname = request.getParameter("nickname");
    sex = request.getParameter("sex");
    
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    StringBuilder ymdSum = new StringBuilder().append(year).append(month).append(day);
    birthday = ymdSum.toString();
    submitFlag = request.getParameter("submitFlag");
%>

<%
    System.out.println("email : " + email);
    System.out.println("password : " + password);
    System.out.println("nickname : " + nickname);
    System.out.println("sex : " + sex);
    System.out.println("birthday : " + birthday);
    System.out.println("submitFlag : " + submitFlag); // 같은 페이지 이기 때문에 submit 이 된건지 확인이 필요.
    // 이럴경우 페이지 새로고침하면 중복 insert 되지 않을까.

    if ("true".equals(submitFlag)) {
        System.out.println("insert start!");
        // DB 에 insert 꼽는다.
        try(Connection conn = DriverManager.getConnection(URL, ID, PW)) {
            // Class.forName("com.mysql.jdbc.Driver");
            String insertQuery = "insert into writer (email, password, nickname, sex, birthday) values "
            + "('" + email + "','" + password + "','" + nickname + "','" + sex + "','" + birthday +"')";

            System.out.println("query : " + insertQuery);

            try (Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(insertQuery); 
                System.out.println("insert success!");               
            } catch (Exception e) {
                System.out.println("insert Query exception : " + e);
            }

            response.sendRedirect("index.jsp");
            
        } catch (Exception e) {
            //TODO: handle exception
            System.out.println("exception : " + e);
        }
        // catch(ClassNotFoundException e) {
        //     System.out.println("connect fail!");
        //     System.out.println("exception : " + e);
        // }
    }
%>