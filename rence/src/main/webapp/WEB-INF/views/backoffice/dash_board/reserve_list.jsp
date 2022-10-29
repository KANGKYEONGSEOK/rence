<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
<div class="titleSection">
        <h1>예약 관리</h1>
      </div>
      <!-- END titleSection -->

      <div class="boardWrap reserve">
        <section class="reserve-header">
          <div class="searchBar-section">
            <div class="searchBar-wrap">
              <div id="type" class="sb_1 type">
                <span>타입</span>
              </div>
              <div class="sb_2">
                <input
                  type="text"
                  placeholder="검색어를 입력하세요."
                  id="input_searchBar"
                />
              </div>

              <!-- CUSTOM SELECT -->
              <section>
                <!-- START TYPE SELECT -->
                <div id="custom-type-select" class="type-select-wrap blind">
                  <ul class="type-select">
                    <li id="type-list-desk" class="type-select-list">데스크</li>
                    <li id="type-list-metting-room" class="type-select-list">
                      회의실
                    </li>
                    <li id="type-list-office" class="type-select-list">
                      오피스
                    </li>
                  </ul>
                </div>
                <!-- END TYPE SELECT -->
              </section>
            </div>
          </div>

          <ul class="reserve-filter-list">
            <li id="reserve-all" class="reserve-item active">전체</li>
            <li id="reserve-ing" class="reserve-item">예약중</li>
            <li id="reserve-cancel" class="reserve-item">취소</li>
            <li id="reserve-end" class="reserve-item">종료</li>
          </ul>
        </section>
        <!-- END reserve-header -->

        <section class="reserveWrap">
          <div class="custom-table">
            <div class="ct-header reserve">
              <div class="ct-header-cell reserve">예약 날짜</div>
              <div class="ct-header-cell reserve">진행 여부</div>
              <div class="ct-header-cell reserve">예약 공간</div>
              <div class="ct-header-cell reserve">예약자</div>
              <div class="ct-header-cell reserve">예약자 연락처</div>
              <div class="ct-header-cell reserve">예약자 이메일</div>
              <div class="ct-header-cell reserve">예약 금액</div>
              <div class="ct-header-cell reserve">결제 방식</div>
            </div>
            <!-- END ct-header -->

            <div class="ct-body">
              <div class="ct-body-row reserve">
                <div class="ct-body-cell">
                  2022.10.27 10:00 ~ <br />2022.10.17 14:00
                </div>
                <div class="ct-body-cell">
                  <button class="ct-body-btn reserve-cancel">취소</button>
                </div>
                <div class="ct-body-cell">101호 개인 스터디름</div>
                <div class="ct-body-cell">전판근</div>
                <div class="ct-body-cell">010-1234-5678</div>
                <div class="ct-body-cell">qwerasdf@gmail.com</div>
                <div class="ct-body-cell reserve-price">40000</div>
                <div class="ct-body-cell">선결제</div>
              </div>
              <!-- END ct-body-row reserve -->

              <div class="ct-body-row reserve">
                <div class="ct-body-cell">
                  2022.10.27 10:00 ~ <br />2022.10.17 14:00
                </div>
                <div class="ct-body-cell">
                  <button class="ct-body-btn reserve-doing">진행중</button>
                </div>
                <div class="ct-body-cell">101호 개인 스터디름</div>
                <div class="ct-body-cell">전판근</div>
                <div class="ct-body-cell">010-1234-5678</div>
                <div class="ct-body-cell">qwerasdf@gmail.com</div>
                <div class="ct-body-cell reserve-price">40000</div>
                <div class="ct-body-cell">선결제</div>
              </div>
              <!-- END ct-body-row reserve -->

              <div class="ct-body-row reserve">
                <div class="ct-body-cell">
                  2022.10.27 10:00 ~ <br />2022.10.17 14:00
                </div>
                <div class="ct-body-cell">
                  <button class="ct-body-btn reserve-ing">예약중</button>
                </div>
                <div class="ct-body-cell">101호 개인 스터디름</div>
                <div class="ct-body-cell">전판근</div>
                <div class="ct-body-cell">010-1234-5678</div>
                <div class="ct-body-cell">qwerasdf@gmail.com</div>
                <div class="ct-body-cell reserve-price">40000</div>
                <div class="ct-body-cell">선결제</div>
              </div>
              <!-- END ct-body-row reserve -->

              <div class="ct-body-row reserve">
                <div class="ct-body-cell">
                  2022.10.27 10:00 ~ <br />2022.10.17 14:00
                </div>
                <div class="ct-body-cell">
                  <button class="ct-body-btn reserve-end">종료</button>
                </div>
                <div class="ct-body-cell">101호 개인 스터디름</div>
                <div class="ct-body-cell">전판근</div>
                <div class="ct-body-cell">010-1234-5678</div>
                <div class="ct-body-cell">qwerasdf@gmail.com</div>
                <div class="ct-body-cell reserve-price">40000</div>
                <div class="ct-body-cell">선결제</div>
              </div>
              <!-- END ct-body-row reserve -->
            </div>
            <!-- END ct-body -->

            <ul class="pagination">
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
          <!-- END custom-table -->
        </section>
        <!-- END reserveWrap -->
      </div>
      <!-- boardWrap reserve -->