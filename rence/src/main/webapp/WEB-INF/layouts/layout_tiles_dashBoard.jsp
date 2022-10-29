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
	
	<link rel="stylesheet" href="${path}/resources/CSS/common.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/dash-commons.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/left-side-menu.css" />
	
	<link rel="stylesheet" href="${path}/resources/CSS/dash-board.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/dash-space-list.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/dash-qna-list.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/dash-review-list.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/dash-reserve-list.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/dash-sales-list.css" />
	<link rel="stylesheet" href="${path}/resources/CSS/custom-table.css" />
	
	<script src="${path}/resources/JS/jquery-3.6.1.min.js"></script>
	<script src="${path}/resources/JS/dashboard.js"></script>
	<script src="${path}/resources/JS/number_comma.js"></script>
	<script src="${path}/resources/JS/host_popup.js"></script>
	
</head>
<body class="bodyWrap">
	<tiles:insertAttribute name="side" />
	<section class="board-contentWrap">
		<tiles:insertAttribute name="content" />
	</section>
	
	<!-- **************** -->
    <!-- popup background -->
    <!-- **************** -->
    <div class="popup-background blind">
      <!-- 공간 추가 팝업 Section -->
      <div id="room-insert-section" class="blind">
        <section class="room-popup-title-section">
          <span>공간 추가</span>
        </section>
        <section class="room-popup-input-section">
          <div class="room-name-wrap">
            <p>공간 이름</p>
            <input
              type="text"
              id="input-room-name"
              class="input-room-name"
              placeholder="공간 이름을 입력해 주세요"
            />
          </div>
          <div class="room-type-wrap">
            <p>공간 타입</p>
            <div class="room-type-select" id="room-type-select">
              <button id="insert-room-type-label" class="room-type-label">
                타입을 선택해 주세요
              </button>
              <ul class="insert-type-select-list blind">
                <li class="insert-type-select-item">데스크</li>
                <li class="insert-type-select-item">4인 회의실</li>
                <li class="insert-type-select-item">6인 회의실</li>
                <li class="insert-type-select-item">10인 회의실</li>
                <li class="insert-type-select-item">오피스</li>
              </ul>
            </div>
            <!-- END room-type-select -->
          </div>
          <!-- END room-type-wrap -->
        </section>
        <!-- room-popup-input-section -->
        <div class="select-btn-group">
          <button id="btn-insert-cancel" class="select-btn">닫기</button>
          <button id="btn-insert" class="select-btn">추가</button>
        </div>
        <!-- END select-btn-group -->
      </div>
      <!-- END room-insert-section -->

      <!-- 공간 수정 팝업 Section -->
      <div id="room-edit-section" class="blind">
        <section class="room-popup-title-section">
          <span>공간 변경</span>
        </section>
        <section class="room-popup-input-section">
          <div class="room-name-wrap">
            <p>공간 이름</p>
            <input
              type="text"
              id="input-room-name"
              class="input-room-name"
              placeholder="공간 이름을 입력해 주세요"
              value=""
            />
          </div>
          <div class="room-type-wrap">
            <p>공간 타입</p>
            <div class="room-type-select" id="room-type-select">
              <button id="edit-room-type-label" class="edit-room-type-label">
                타입을 선택해 주세요
              </button>
              <ul class="edit-type-select-list blind">
                <li class="edit-type-select-item">데스크</li>
                <li class="edit-type-select-item">4인 회의실</li>
                <li class="edit-type-select-item">6인 회의실</li>
                <li class="edit-type-select-item">10인 회의실</li>
                <li class="edit-type-select-item">오피스</li>
              </ul>
            </div>
            <!-- END room-type-select -->
          </div>
          <!-- END room-type-wrap -->
        </section>
        <!-- room-popup-input-section -->
        <div class="select-btn-group">
          <button id="btn-edit-cancel" class="select-btn">닫기</button>
          <button id="btn-edit" class="select-btn">변경</button>
        </div>
        <!-- END select-btn-group -->
      </div>
      <!-- END room-edit-section -->

      <!-- START DELETE CONFIRM POPUP -->
      <div id="host-delete-popup" class="confirm-popup blind">
        <section class="confirm-txt-section">
          <span class="delete-txt">
            해당 공간을 정말 삭제하시겠습니까? <br />삭제하시면 다시 복구 할 수
            없습니다</span
          >
        </section>
        <section class="confirm-btn-section">
          <div class="confirm-yesBtn">삭제</div>
          <div id="delete-closeBtn" class="confirm-noBtn">닫기</div>
        </section>
      </div>
      <!-- END DELETE FONFIRM POPUP -->

      <!-- START SUCCESS CUSTOM ALERT POPUP -->
      <div id="insert-success-alert-popup" class="alert-popup blind">
        <section class="alert-txt-section">
          <span>공간이 성공적으로 추가 되었습니다.</span>
        </section>
        <section id="insert-success-alert-btn" class="alert-btn-section">
          <span>확인</span>
        </section>
      </div>

      <!-- START SUCCESS CUSTOM ALERT POPUP -->
      <div id="edit-success-alert-popup" class="alert-popup blind">
        <section class="alert-txt-section">
          <span>공간이 성공적으로 변경 되었습니다.</span>
        </section>
        <section id="edit-success-alert-btn" class="alert-btn-section">
          <span>확인</span>
        </section>
      </div>

      <!-- START SUCCESS CUSTOM ALERT POPUP -->
      <div id="delete-success-alert-popup" class="alert-popup blind">
        <section class="alert-txt-section">
          <span>공간이 성공적으로 삭제 되었습니다.</span>
        </section>
        <section id="delete-success-alert-btn" class="alert-btn-section">
          <span>확인</span>
        </section>
      </div>

      <!-- START SUCCESS CUSTOM ALERT POPUP -->
      <div id="delete-fail-alert-popup" class="alert-popup blind">
        <section class="alert-txt-section">
          <span
            >해당 공간에 예약이 있기 때문에 <br />공간 삭제가
            불가능합니다.</span
          >
        </section>
        <section id="delete-fail-alert-btn" class="alert-btn-section">
          <span>확인</span>
        </section>
      </div>
      
      <!-- START comment popup -->
      <div id="comment-section" class="blind">
        <section class="comment-popup-title-section">
          <span>답변 달기</span>
        </section>
        <section class="user-comment-section">
          <div class="user-comment-title">
            <h5>문의 공간</h5>
            <p>101호 개인 스터디룸</p>
          </div>
          <div class="user-comment-content">
            <h5>문의 내용</h5>
            <pre>
문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 </pre
            >
          </div>
        </section>
        <section class="host-comment-section">
          <h5>답변</h5>
          <textarea
            name="host-comment"
            id="host-comment"
            placeholder="문의 답변을 입력해 주세요."
          ></textarea>
        </section>

        <div class="button-group">
          <button class="btn-comment-cancel">취소</button>
          <button class="btn-comment-confirm">등록</button>
        </div>
      </div>
      <!-- END popup-background blind -->
    </div>
    <!-- END popup-background blind -->
</body>
</html>