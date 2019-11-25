<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>KakaoLink v2 Demo(Default / Feed) - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-link-btn" href="javascript:sendLink()">
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 <script>window.jQuery || document.write('<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"><\/script>')</script> 

    <!--jQuery 적용중이면 윗줄은 지우셔도 됩니다. 모르면 윗줄 까지 붙여넣으세요.-->

    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

    <script>

    var firstImg=$(".imageblock:first-of-type img");

    var contents="";

    //var contents=$('article p').text().replace(/(<([^>]+)>)/ig,'').substring(0,200);  //공유되는 메시지에 본문 내용을 포함하려면 맨 앞의 //를 지우세요.

    if(firstImg.attr("src")){

        var firstImgSrc=firstImg.attr("src");

        var firstImgRatio = parseInt(firstImg.css("height"))/parseInt(firstImg.css("width"));

        if (firstImgRatio <=0.27) var firstImgRatio=0.27;

    }else{var firstImgSrc=location.origin+"/favicon.ico";var firstImgRatio=1}

    Kakao.init('자바스크립트 키'); //위에서 복사한 자바스크립트 키를 왼쪽에 붙여넣으세요.

    Kakao.Link.createTalkLinkButton({

      container: '#kakao-link-btn',

      label: '['+document.getElementsByTagName("TITLE")[0].text+']\n'+contents+'...',

      image: {

        src: firstImgSrc,

        width: '300',

        height: parseInt(300*firstImgRatio)

      },

      webButton: {

        text: '블로그에서 이어보기',

        url: location.origin+location.pathname

      }

    });

    </script>
</body>