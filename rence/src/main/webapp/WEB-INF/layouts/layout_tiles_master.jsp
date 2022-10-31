<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<title><tiles:getAsString name="title"></tiles:getAsString></title>
	<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">

	<link rel="stylesheet" href="${path}/resources/CSS/common/common.css" />	
	<link rel="stylesheet" href="${path}/resources/CSS/common/custom-table.css" />
	
	<link rel="stylesheet" href="${path}/resources/CSS/master/master-header.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/master/master-main.css" />
	
	
	<script src="${path}/resources/JS/common/jquery-3.6.1.min.js"></script>
	<script src="${path}/resources/JS/master/master.js"></script>
	
</head>

<body class="bodyWrap">
	<div class="pageWrap">
		<tiles:insertAttribute name="header" />
		<section class="pageWrap">
			<tiles:insertAttribute name="content" />
		</section>
	</div>
	
	<div class="popup-background blind">
		<div id ="grant-popup" class="confirm-popup blind">
            <section class="confirm-txt-section">
                <span class="logout-txt">
                	해당 호스트를 승낙하시겠습니까?
                </span>
            </section>
            <section class="confirm-btn-section">
                <div id="grant-btn" class="confirm-yesBtn">가입 승인</div>
                <div id="grant-closeBtn" class="confirm-noBtn">닫기</div>
            </section>
        </div>
	</div>
	
</body>
</html>