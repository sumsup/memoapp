<%@ page language="java" session="false" pageEncoding="UTF-8" contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="map.*" %>
<%@ page import="map.dto.*" %>
<%-- <jsp:useBean id="memoList" class="map.SettingMemo" /> --%>
<%
    SettingMemo memoList = new SettingMemo();
    ArrayList<MemoDTO> memos = memoList.getMemoList();
    for (MemoDTO memoDTO : memos) {
%>
    <p> - 가입자 목록 - </p>
    <p> <%= memoDTO.getId() %> </p>
    <p> <%= memoDTO.getEmail() %> </p>
    <p> <%= memoDTO.getPassword() %> </p>
    <p> <%= memoDTO.getNickname() %> </p>
    <p> <%= memoDTO.getSex() %> </p>
    <p> <%= memoDTO.getBirthday() %> </p>
<%
    }
%>
