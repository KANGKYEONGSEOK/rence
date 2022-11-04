<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<div class="titleSection">
	<h1>공간 관리</h1>
	<button id="btn-room-add" class="btn-room-add">추가</button>
	<ul class="mini-nav">
		<li><p id="mini-nav-list" class="nav-item" id="room-list">리스트</p></li>
		<li><p id="mini-nav-qna" class="nav-item" id="qna-list">문의</p></li>
		<li><p id="mini-nav-review" class="nav-item" id="review-list">후기</p></li>
	</ul>
	<!-- END mini-nav -->
</div>
<!-- END titleSection -->

<div class="boardWrap qna">
	<div class="custom-table qna">
		<div class="ct-header qna">
			<div class="ct-header-cell qna">처리 상태</div>
			<div class="ct-header-cell qna">문의 공간</div>
			<div class="ct-header-cell qna">문의 내용</div>
			<div class="ct-header-cell qna">작성일</div>
			<div class="ct-header-cell qna">답변</div>
		</div>
		<!-- END ct-header -->

		<div class="ct-body-row qna">
			<div class="ct-body-cell qna">
				<p class="qna-process true">처리</p>
			</div>
			<div class="ct-body-cell qna">
				<p>101호 개인 스터디름</p>
			</div>
			<div class="ct-body-cell qna">
				<p>문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용문의내용 문의내용 문의내용 문의내용 문의내용
					문의내용 문의내용문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용문의내용 문의내용 문의내용 문의내용 문의내용
					문의내용 문의내용문의내용 문의내용 문의내용 문의내용</p>
			</div>
			<div class="ct-body-cell qna">
				<p>2022.10.27</p>
			</div>
			<div class="ct-body-cell qna">
				<button class="ct-body-btn qna-edit">답변 수정</button>
			</div>
			<!-- END ct-body-cell -->
		</div>
		<div class="detail-qna-wrap">
            <div class="question-section">
              <h5 class="question-title">Q.</h5>
              <p class="question-content">
                문의내용 문의내용 문의내용 문의내용 문의내용 문의내용
                문의내용문의내용 문의내용 문의내용 문의내용 문의내용 문의내용
                문의내용문의내용 문의내용 문의내용 문의내용 문의내용 문의내용
                문의내용문의내용 문의내용 문의내용 문의내용 문의내용 문의내용
                문의내용문의내용 문의내용 문의내용 문의내용
              </p>
            </div>
            <!-- END question-section -->
            <div class="answer-section">
              <div class="answer-title-section">
                <h5 class="answer-title">A.</h5>
                <p class="answer-date">작성일 | 2022-11-04 10:00:47</p>
              </div>
              <p class="answer-content">
                답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변
                내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용
                답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변
                내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용
                답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용 답변
                내용 답변 내용 답변 내용 답변 내용 답변 내용 답변 내용
              </p>
            </div>
            <!-- END answer-section -->
          </div>
          <!-- deatil-qna-wrap -->
		<!-- END ct-body-row -->
		<div class="ct-body-row qna">
			<div class="ct-body-cell qna">
				<p class="qna-process false">미처리</p>
			</div>
			<div class="ct-body-cell qna">
				<p>101호 개인 스터디름</p>
			</div>
			<div class="ct-body-cell qna">
				<p>문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용문의내용 문의내용 문의내용 문의내용 문의내용
					문의내용 문의내용문의내용 문의내용 문의내용 문의내용 문의내용 문의내용 문의내용문의내용 문의내용 문의내용 문의내용 문의내용
					문의내용 문의내용문의내용 문의내용 문의내용 문의내용</p>
			</div>
			<div class="ct-body-cell qna">
				<p>2022.10.26</p>
			</div>
			<div class="ct-body-cell qna">
				<button class="ct-body-btn qna-add">답변 달기</button>
			</div>
			<!-- END ct-body-cell -->
		</div>
		<!-- END ct-body-row -->

		<!-- END custom-table -->

		<ul class="pagination blind">
			<li class="page-item">
				<button>
					<img src="${path}/resources/IMG/dash-board/ico-double-left.svg" alt="-10" />
				</button>
			</li>
			<li class="page-item">
				<button>
					<img src="${path}/resources/IMG/dash-board/ico-left.svg" alt="-1" />
				</button>
			</li>
			<li class="page-item"><button>1</button></li>
			<li class="page-item"><button>2</button></li>
			<li class="page-item"><button>3</button></li>
			<li class="page-item"><button>4</button></li>
			<li class="page-item"><button>5</button></li>
			<li class="page-item">
				<button>
					<img src="${path}/resources/IMG/dash-board/ico-right.svg" alt="+1" />
				</button>
			</li>
			<li class="page-item">
				<button>
					<img src="${path}/resources/IMG/dash-board/ico-double-right.svg" alt="+10" />
				</button>
			</li>
		</ul>
		<!-- END pagination -->
	</div>
</div>
<!-- END boardWrap qna -->