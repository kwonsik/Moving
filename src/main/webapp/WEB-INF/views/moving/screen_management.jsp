<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_inc/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/admin_assets/css/admin_hy.css" />

			<!-- 상영관 관리 페이지 -->
			<main id="content" class="col-md-9">
                <div id="screen-management" class="page">
                    <h2>상영관 관리</h2>
                    <div class="sub_content">
                        <h4>ex 압구정 시네마</h4>
                        <hr>

                        <table id="sm">
                            <thead>
                                <tr><th scope="row"></th>
                                    <th scope="row">좌석 수</th>
                                    <th scope="row">보류 좌석</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a href="">ex 상영관1</a></td>
                                    <td>50</td>
                                    <td>3</td>
                                    <td>
                                        <input type="button" value="상영관 보류" id="stop-scr-btn">
                                    </td>
                                 
                                </tr>
                                 <tr>
                                    <td><a href="">ex 상영관2</a></td>
                                    <td>100</td>
                                    <td>1</td>
                                    <td>
                                        <input type="button" value="상영관 보류" id="stop-scr-btn">
                                    </td>
                                </tr> 
                            </tbody>
                        </table>
                
                        <section style="min-height: 300px;"></section>
                    </div>
                    
                </div>
            </main>
        

<%@ include file="../admin_inc/footer.jsp"%>
