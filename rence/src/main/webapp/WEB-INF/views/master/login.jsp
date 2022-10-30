<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
	<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
	
	<link rel="stylesheet" href="${path}/resources/CSS/master-login.css" />
	
	<script src="${path}/resources/JS/jquery-3.6.1.min.js"></script>
	
<title>Rence Master 로그인</title>
</head>
<body>
<div class="contentWrap">
      <div class="loginWrap">
        <div class = "logo-section">
         <img src="${path}/resources/IMG/common/Rence-Master.svg" class="logo-mku">
     	</div>
        <!-- END logoSection -->

        <div class="inputSection">
          <input
            id="backoffice_id"
            type="text"
            placeholder="아이디를 입력하세요 (사업자 등록 번호)"
          />
          <input
            id="backoffice_pw"
            type="password"
            placeholder="비밀번호를 입력하세요"
          />
        </div>
        <!-- END inputSection -->

        <button id="btn-master-login" class="btn-master-login">로그인</button>
      </div>
      <!-- END loginWrap -->
    </div>
    <!-- END contentWrap -->
</body>
</html>