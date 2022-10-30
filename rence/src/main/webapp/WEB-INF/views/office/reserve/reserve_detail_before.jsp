<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="space-detail-wrap">
    <section class="page-title-section">
        <span class="page-title">과거에 예약한 공간 정보를 보여드려요</span>
    </section>

    <section class="body-semi-wrap">
        <div class="deatil-info-section">
            <section class="reserve-info-section">
                <span class="section-title">예약 정보</span>
                <div class="reserve-info-wrap">
                    <section>
                        <img src="${path}/resources/IMG/reserve-list/default-space.svg" alt="result-img" class="reserve-info-img" />
                    </section>
                    <section class="reserve-info-txt">
                        <span class="info-company-name">오라운트 스터디룸</span>
                        <ul class="info-li-wrap">
                            <li class="info-li">
                                <label class="info-label">공간 타입</label>
                                <span class="info-text">데스크</span>
                            </li>
                            <li class="info-li">
                                <label class="info-label">예약 날짜</label>
                                <span class="info-text">2022.10.30 10:00 ~ 2022.10.30 12:00</span>
                            </li>
                            <li class="info-li">
                                <label class="info-label">공간 이름</label>
                                <span class="info-text">101호 1인 데스크</span>
                            </li>
                            <li class="info-li">
                                <label class="info-label">공간 가격</label>
                                <span class="info-text">10,000원/시간</span>
                            </li>
                        </ul>
                    </section>
                </div>
            </section>
            <section class="user-host-info-section">
                <section class="uh-info-section">
                    <span class="person-type-title">예약자 정보</span>
                    <div class="uh-info-wrap">
                        <ul>
                            <li class="host-info-li">
                                <label class="uh-label">예약자</label>
                                <span class="uh-text">전판근</span>
                            </li>
                            <li class="host-info-li">
                                <label  class="uh-label">연락처</label>
                                <span class="uh-text">010-1234-5678</span>
                            </li>
                            <li class="host-info-li">
                                <label  class="uh-label">이메일</label>
                                <span class="uh-text">asdc@naver.com</span>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="uh-info-section">
                    <span class="person-type-title">호스트 정보</span>
                    <div class="uh-info-wrap">
                        <ul>
                            <li class="host-info-li">
                                <label class="uh-label">사업자명</label>
                                <span class="uh-text">오라운트</span>
                            </li>
                            <li class="host-info-li">
                                <label  class="uh-label">위치</label>
                                <span class="uh-text">경기도 광주시 오포읍 양벌로 320-4 (오라운트)</span>
                            </li>
                            <li class="host-info-li">
                                <label  class="uh-label">연락처</label>
                                <span class="uh-text">010-1234-5678 aaa@gmail.com</span>
                            </li>
                        </ul>
                    </div>
                </section>
            </section>
            <section  class="careful-info-section">
                <span class="section-title">예약시 주의 사항</span>

                <ul class="section-list-wrap">
                    <li class="section-list">1. 결제 방법 - 선결제 선택 시 보증금 없이 총 사용 금액이 결제됩니다.</li>
                    <li class="section-list">2. 결제 방법 - 당일 결제 선택 시 보증금(총 예약 금액의 20%)만 결제되며, 나머지 금액은 예약 당일 해당 공간에서 이루어집니다.</li>
                    <li class="section-list">3. 공간 내 기물 파손 시 배상해야 해며, 배상 시 비용은 새제품 가격으로 책정됩니다.</li>
                    <li class="section-list">4. 공간 내 화기 사용은 금하며, 건물 전체가 금연 건물입니다.</li>
                    <li class="section-list">5. 공간 내 간단한 음료와 간식만 드실 수 있으며, 드신 후 쓰레기는 분리 배출 부탁드립니다.</li>
                    <li class="section-list">6. 이용중 지나친 소음이 발생하지 않도록 주의 부탁드립니다.</li>
                    <li class="section-list">7. 선결제 시, 총 결제 금액의 5%가 마일리지로 적립됩니다.</li>
                </ul>
            </section>
            <section class="refund-info-section">
                <span class="section-title">환불 규정 안내</span>
                <ul class="refund-list-wrap">
                    <li class="refund-list">
                        <label class="refund-label">예약 후 1시간 이내 취소</label>
                        <span>
                            총 금액의 100% 환불
                        </span>
                    </li>
                    <li class="refund-list">
                        <label class="after-refund-label">예약 후 1시간 이후 취소</label>
                        <span>
                            총 금액의 80% 환불 (보증금을 제외한 나머지 가격 환불)
                        </span>
                    </li>
                </ul>
            </section>
            <section class="payment-section">
                <span class="section-title">결제 금액 안내</span>
                <div class="payment-info-wrap">
                    <section class="payment-company-section">
                        <ul class="payment-info-li-wrap">
                            <li class="info-li">
                                <label class="info-label">공간 타입</label>
                                <span class="info-text">데스크</span>
                            </li>
                            <li class="info-li">
                                <label class="info-label">예약 날짜</label>
                                <span class="info-text">2022.10.30 10:00 ~ 2022.10.30 12:00</span>
                            </li>
                            <li class="info-li">
                                <label class="info-label">공간 이름</label>
                                <span class="info-text">101호 1인 데스크</span>
                            </li>
                            <li class="info-li">
                                <label class="info-label">공간 가격</label>
                                <span class="info-text">10,000원/시간</span>
                            </li>
                        </ul>
                    </section>
                    <section class="pay-mileage-section">
                        <ul class="payment-info-li-wrap">
                            <li class="info-li">
                                <label class="pay-info-label">총 결제 금액</label>
                                <span class="pay-info-text">40,000원</span>
                            </li>
                            <li class="info-li">
                                <label class="pay-info-label">마일리지 예상 적립 금액</label>
                                <span class="pay-info-text">200원</span>
                            </li>
                        </ul>
                    </section>
                </div>
            </section>
        </div>
        <div id = "footerWrap">
            <h5>© Golfzon Tech Academy, Inc. All rights reserved.</h5>
        </div>
    </section>
</div>