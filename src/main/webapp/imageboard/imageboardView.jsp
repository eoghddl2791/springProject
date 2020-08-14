<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table border="1" cellspacing="0" cellpadding="4" frame="hsides" rules="rows">
 <tr>
  <td rowspan="5"><img src="../storage/${imageboardDTO.image1 }" id="imageView" width="200" height="200">
  <img src="../image/magnifier.png" width="20" height="20" onclick="bigImage()" style="cursor: pointer">
  <img src="../image/magnifier.png" width="20" height="20" id="bigImage" style="cursor: pointer"></td>
 </tr>
 <tr>
  <td><font size="12">${imageboardDTO.imageName }</font></td>
 </tr>
 <tr>
  <td>단&emsp;&emsp; 가: <fmt:formatNumber value="${imageboardDTO.imagePrice }" pattern="#,###,###원"/></td>
 </tr>
 <tr>
  <td>상품 갯수: <fmt:formatNumber value="${imageboardDTO.imageQty }" pattern="#,###,###"/></td>
 </tr>
 <tr>
  <td>합&emsp;&emsp; 계: <fmt:formatNumber value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }" pattern="#,###,###원"/></td>
 </tr>
 <tr>
  <td colspan="2"><textarea rows="10" cols="80" readonly style="">${imageboardDTO.imageContent }</textarea></td>
 </tr>
</table>

<input type="button" value="목록" onclick="location.href='../imageboard/imageboardList.do?pg=${pg}'">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function bigImage(){
	var newWindow = window.open("","","width=500 height=500");
	
	var img = newWindow.document.createElement("img");
	img.setAttribute("src", "http://localhost:8080/miniProject/storage/${imageboardDTO.image1 }");//크롬에선 상대주소가아닌 풀주소를 원한다.
	img.setAttribute("width", "500");
	img.setAttribute("height", "500");
	newWindow.document.body.appendChild(img);
}
$('#bigImage').click(function(){
	var newWindow = window.open(url, '', 'width=500 height=500');
	var url = $('#imageView').attr('src');
	window.open(url, '', 'width=500 height=500');
});
</script>

