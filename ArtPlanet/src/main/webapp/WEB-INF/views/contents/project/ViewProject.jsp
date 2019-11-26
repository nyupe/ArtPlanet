<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<section class="blog_area area-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mb-5 mb-lg-0">
				<div class="blog_left_sidebar">
					<article class="blog_item">
						<div class="blog_item_img">
							<img class="card-img rounded-0"
								src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""> <a href="#"
								class="blog_item_date">
								<h3>15</h3>
								<p>Jan</p>
							</a>
						</div>

						<div class="blog_details">
							<a class="d-inline-block" href="<c:url value='/ViewPost'/>">
								<h2>Google inks pact for new 35-storey office</h2>
							</a>
							<p>That dominion stars lights dominion divide years for
								fourth have don't stars is that he earth it first without
								heaven in place seed it second morning saying.</p>
							<ul class="blog-info-link">
								<li><a href="#"><i class="far fa-user"></i> Travel,
										Lifestyle</a></li>
								<li><a href="#"><i class="far fa-comments"></i> 03
										Comments</a></li>
							</ul>
						</div>
					</article>
					<span class="sociallink ml-1">
					    <a href="javascript:sendLinkKakao()" id="kakao-link-btn" title="카카오톡으로 공유">
					        <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width=36 alt="Kakaotalk">
					    </a>
					</span>

					<script>
					Kakao.init('e48160c4b97a640dbc60d607fb8fcb59');
					function sendLinkKakao(){
					    Kakao.Link.sendDefault({
					      objectType: 'feed',
					      content: {
					          title: '딸기 치즈 케익',
					          description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
					          imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
					          link: {
					            mobileWebUrl: 'https://developers.kakao.com',
					            webUrl: 'https://developers.kakao.com'
					          }
					      },
					      social: {
					          likeCount: 286,
					          commentCount: 45,
					          sharedCount: 845
					        },
					        buttons: [
					            {
					              title: '웹으로 보기',
					              link: {
					                mobileWebUrl: 'https://developers.kakao.com',
					                webUrl: 'https://developers.kakao.com'
					              }
					            },
					            {
					              title: '앱으로 보기',
					              link: {
					                mobileWebUrl: 'https://developers.kakao.com',
					                webUrl: 'https://developers.kakao.com'
					              }
					            }
					          ]
					    }); 
					}
					</script>
					

					

					
					



				
				</div>
			</div>
			
		</div>
	</div>
</section>