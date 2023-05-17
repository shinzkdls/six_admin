<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- passwordReset.jsp --%>
<%
    String targetUsername = "id01"; // 초기화할 대상 아이디
    String newPassword = "1"; // 새로운 비밀번호

    // 여기에 특정 아이디의 비밀번호 초기화에 관련된 추가 로직을 작성할 수 있습니다.
    // 예를 들어, 데이터베이스에 저장된 사용자 비밀번호를 업데이트하는 등의 작업을 수행할 수 있습니다.

    // 예시로 아이디가 "jhs"인 사용자의 비밀번호를 업데이트하는 로직을 작성합니다.
    if (targetUsername.equals("id01")) {
        // 데이터베이스 업데이트 또는 필요한 작업 수행

        // out.println(targetUsername + " 사용자의 비밀번호가 초기화되었습니다. 새로운 비밀번호: " + newPassword);
    } else {
        // out.println("해당 아이디를 찾을 수 없습니다.");
    }
%>