<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>playduck - 리뷰 작성하기</title>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/headerfooter.css">
    <link rel="stylesheet" href="../resources/css/join.css">
	<link rel="stylesheet" href="../resources/css/login.css">
	<link rel="stylesheet" href="../resources/css/findIdPw.css">
    <link rel="stylesheet" href="../resources/css/reviewWrite.css">
   	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<script src="../resources/js/modal.js"></script>
	<script src="../resources/js/topBtn.js"></script>
</head>

<body>
     <%@ include file="common/header.jsp"%>
    <section>
   

        <h3 class="rw_title">레미제라블</h3>
        <div class="rw_posterArea">
            <img class="rw_poster" src="../resources/images/poster.jpg" alt="">
        </div>
        <form name="reviewForm" action="${pageContext.request.contextPath}/review/reviewWrite.do" method="post" onsubmit="return validate();">
        <div class="rw_reviewTab">
            <img class="good" src="../resources/images/review_good_current.png" alt="">
            <img class="good_gray" data-tab="good_gray" src="../resources/images/review_good.png" alt="">
            <img class="bad" src="../resources/images/review_bad_current.png" alt="">
            <img class="bad_gray" data-tab="bad_gray" src="../resources/images/review_bad.png" alt="">
            
        </div>
        <script>
            $(document).ready(function () {
                /*웹페이지 열었을 때*/
                $(".good").show();
                $(".bad_gray").show();
                $(".good_gray").hide();
                $(".bad").hide();
                $(".rw_reviewTab").append('<input type="text" class="hidden" id="rw_good" name="rw_good" value="1" />')

                /*bad_gray 클릭했을 때 bad를 보여줌*/
                $(".bad_gray").click(function () {
                    $(".good").hide();
                    $(".bad_gray").hide();
                    $(".good_gray").show();
                    $(".bad").show();
                    $("#rw_good").remove();
                    $(".rw_reviewTab").append('<input type="text" class="hidden" id="rw_bad" name="rw_bad" value="2" />')
                });

                /*good_gray를 클릭했을 때 good을 보여줌*/
                $(".good_gray").click(function () {
                    $(".good").show();
                    $(".bad_gray").show();
                    $(".good_gray").hide();
                    $(".bad").hide();
                    $("#rw_bad").remove();
                    $(".rw_reviewTab").append('<input type="text" class="hidden" id="rw_good" name="rw_good" value="1" />')
                });

            });
        </script>
        <h4 class="rw_contentTitle">평점</h4>
        <table class="rw_ratingArea">
            <tr>
                <td class="rw_ratingTitle">공연장</td>
                <td><input class="rw_rageBar" name="pd_theater" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value1').innerHTML=this.value + '%';"> <span id="value1">80%</span></td>
            </tr>
            <tr>
                <td class="rw_ratingTitle">스토리</td>
                <td><input class="rw_rageBar" name="pd_story" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value2').innerHTML=this.value + '%';"> <span id="value2">80%</span></td>
            </tr>
            <tr>
                <td class="rw_ratingTitle">연출</td>
                <td><input class="rw_rageBar" name="pd_producing" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value3').innerHTML=this.value + '%';"> <span id="value3">80%</span></td>
            </tr>
            <tr>
                <td class="rw_ratingTitle">캐스팅</td>
                <td><input class="rw_rageBar" name="pd_casting" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value4').innerHTML=this.value + '%';"> <span id="value4">80%</span></td>
            </tr>
        </table>
        <h4 class="rw_contentTitle">한줄평</h4>
        <div class="rw_reviewArea">
        <textarea class="rw_review" cols="70" rows="2"
              style="resize:none;"></textarea></div>
              
              <input type="submit" class="rw_writeBtn" value="리뷰 작성하기" >
              <!-- <button class="rw_writeBtn" onclick = "fn_goReviewWrite()">리뷰 작성하기</button>  -->
				
				</form>
    </section>
    <br /><br /><br /><br /><br />
    <%@ include file="common/footer.jsp"%>
</body>

</html>