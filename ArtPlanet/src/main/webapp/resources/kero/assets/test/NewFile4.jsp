<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="srpgs-container">
	<!-- Photo placeholders -->
	<div id="srpgs-slideshow">
		<div id="srpgs-rotate-1" class="srpgs-holder"><img src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>" /></div>
		<div id="srpgs-rotate-2" class="srpgs-holder"><img src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>" /></div>
	</div>
	
	<!-- Photo slideshow controls -->
	<div id="srpgs-control">
		<div class="srpgs-thumbs-nav copyright"><a href="http://www.javascriptbank.com" title="Copyright 2013">+</a></div>
		<div class="srpgs-thumbs-nav up"></div>
		<div id="srpgs-thumbs-gallery"></div>
		<div class="srpgs-thumbs-nav down"></div>
		<div id="srpgs-control-btns">
			<div id="srpgs-control-back"></div>
			<div id="srpgs-control-play-pause"></div>
			<div id="srpgs-control-next"></div>
		</div>
	</div>
	
	<!-- Titles and subjects of the photos -->
	<div id="srpgs-picture">
		<span id="srpgs-picture-title"></span>
		<p class="srpgs-picture-link">
			In: <a href="#" id="srpgs-picture-url"></a>
		</p>
	</div>
</div>

</body>
</html>