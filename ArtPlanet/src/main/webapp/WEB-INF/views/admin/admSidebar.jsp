<!-- 왼쪽바 시작 -->
<div class="app-sidebar-wrapper">
	<div class="app-sidebar sidebar-shadow">
		<input type="hidden" value="${cancelButtonShow}" id="number" />
		<div>
			<a class="navbar-brand logo_h"
				href="<c:url value='/Search/Artwork'/>"> <img
				style="width: 200px; height: 86px;"
				src="<c:url value='/resources/img/logo.png'/>" alt="logo">
			</a> <a href="#" data-toggle="tooltip" data-placement="bottom"
				title="KeroUI Admin Template" class="logo-src"></a>
		</div>

		<div class="scrollbar-sidebar scrollbar-container">
			<div class="app-sidebar__inner">
				<ul class="vertical-nav-menu">
					<li class="app-sidebar__heading">Admin Menu</li>
					<li class="mm-active"><a href="#"> <i
							class="metismenu-icon pe-7s-rocket"></i> 회원관리 <i
							class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
					</a>
						<ul>
							<li><a href="<c:url value='/AdmUserInfo.ad'/>">가입회원</a></li>
						</ul></li>

					<!-- 작품관리 -->
					<li class="mm-active"><a href="#"> <i
							class="metismenu-icon pe-7s-rocket"></i> 결제관리 <i
							class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
					</a>

						<ul>
							<li><a href="<c:url value='/AdmUserPay.ad'/>">[ARTCLASS]일반결제</a></li>
							<hr style="background-color: gray; height: 1px; width: 220px" />
							<li><a href="<c:url value='/AdmUserBatch.ad'/>">[BLOG]정기결제-배치키</a></li>
							<li><a href="<c:url value='/RecurringPayOrder.do'/>">[BLOG]정기결제-관리자결제</a></li>
							<li><a href="<c:url value='/AdmUserRecPay.ad'/>">[BLOG]정기결제-결제내역</a></li>
							<hr style="background-color: gray; height: 1px; width: 220px" />
							<li><a href="<c:url value='/AdmUserProjBatch.ad'/>">[PROJECT]후원-배치키(일회성)</a></li>
							<li><a href="<c:url value='/ProjectPayOrder.do'/>">[PROJECT]후원-관리자결제</a></li>
							<li><a href="<c:url value='/AdmUserProjPay.ad'/>">[PROJECT]후원-결제내역</a></li>

						</ul> <!-- 결제관리 -->
					<li class="mm-active"><a href="#"> <i
							class="metismenu-icon pe-7s-rocket"></i> 작품관리 <i
							class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
					</a>

						<ul>
							<li><a href="">프로젝트</a></li>
							<li><a href="">클래스</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- 앱 사이드바 이너 -->
		</div>
		<!-- 스크롤바 사이드바 스크롤바 컨테이너 -->
	</div>
	<!-- 앱 사이드바 사이드바 섀도우 -->
</div>
<!-- 왼쪽바 끝 -->