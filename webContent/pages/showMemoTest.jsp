<%@ page language="java" session="false" pageEncoding="UTF-8" contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="map.*" %>
<%@ page import="map.dto.*" %>
<%@ page import="map.rest.domain.memo.MemoDTO" %>
<%-- <jsp:useBean id="memoList" class="map.SettingMemo" /> --%>
<%
    SettingMemo memoList = new SettingMemo();
    ArrayList<MemoDTO> memos = memoList.getMemoList();
    for (MemoDTO memoDTO : memos) {
%>
    <p> - 가입자 목록 - </p>
    <p> <%= memoDTO.getId() %> </p>
<%
    }
%>
