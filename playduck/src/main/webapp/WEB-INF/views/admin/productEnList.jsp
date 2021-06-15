<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 등록</title>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/sidevar.css">
<link rel="stylesheet" href="../resources/css/admin.css">
<script src="../resources/js/jquery-3.6.0.min.js"></script>
</head>

<body>

	<%@ include file="sidevar.jsp"%>

	<div class="AD_main_container">


		<div class="AD_main_productEn">

			<form method="post" action="${pageContext.request.contextPath}/admin2/mdEnIn.do" enctype="multipart/form-data" id="productForm">

				<div class="AD_productEn_title">상품 등록</div>




				<div class="AD_productEn_img_info">
					<div class="AD_productEn_img">
						<img src="../resources/images/noimage.png" id="preview" onclick="mainPic()"> <input
							type="file" style="display: none;" id="productMainPic" name="mainP" >
					</div>

					<div class="AD_productEn_info">
						<table class="AD_productEn_info_table1">
							<tr>
								<td>상품명</td>
								<td><input type="text" class="productEn_input"
									id="productName" name="name"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="number" class="productEn_input"
									id="productPrice" name="price"></td>
							</tr>
							<tr>
								<td>수량</td>
								<td><input type="number" class="productEn_input"
									id="productQuan" name="quan"></td>
							</tr>
						</table>
						<table class="AD_productEn_info_table2">

							<tr>
								<td>상세 이미지 등록</td>
							</tr>

							<tr>
								<td><input type="text" class="upload_text"
									readonly="readonly" id="productPic" >

									<div class="AD_upload-btn_wrap">
										<button type="button" title="파일등록" class="productEn_fbutton">
											파일등록</button>
										<input type="file" class="input_file" title="파일찾기"
											id="imgSelect" name="detailP">
									</div></td>
							</tr>
						</table>


					</div>

				</div>
			</form>

			<div class="AD_productEn_div_sbutton">
				<button class="AD_productEn_sbutton" type="button"
					onclick="productbtn()">상품 등록</button>
			</div>

		</div>
		</form>
	</div>




	<%@ include file="../common/footer.jsp"%>

</body>


<script>
    $(function () {
        $('.upload_text').val();
        $('.input_file').change(function () {
            var filename = $(this).val();
            $('.upload_text').val(filename);
        });
    });


    function mainPic() {
        $("#productMainPic").click();
    }

    $(function () {
        $("#productMainPic").on('change', function () {
            readURL(this);
        });
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    function productbtn() {

        if ($("#productName").val() == "" || $("#productPrice").val() == "" ||
            $("#productQuan").val() == "" || $('#productPic').val() == "" || $('#productMainPic').val() == "") {
            if ($("#productName").val() == "") {
                alert("상품명을 입력해 주세요")
            } else if ($("#productPrice").val() == "") {
                alert("가격을 입력해 주세요")
            } else if ($("#productQuan").val() == "") {
                alert("수량을 입력해 주세요")
            } else if ($("#productPic").val() == "") {
                alert("사진파일을 등록해 주세요")
            } else if ($("#productMainPic").val() == "") {
                alert("메인사진을 등록해 주세요")
            }

        } else {
            $("#productForm").submit();
        }
    }

 
</script>

</html>