<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="RGB viewer">
<meta name="author" content="byunghwa.son">

<title>GOCI RGB Viewer</title>

<!-- Favicon -->
<link rel="icon" href="favicon.ico" type="image/x-icon" />

<!--Bootstrap Framework Version 3.3.7-->
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">

<!--Font Awesome Version 4.6.3 -->
<link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">

<!-- Stylesheets -->
<link href="css/vendors.css" type="text/css" rel="stylesheet">
<link href="css/style.css" type="text/css" rel="stylesheet" id="style">
<link href="css/components.css" type="text/css" rel="stylesheet" id="components">

<!--Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400,400i" rel="stylesheet">

<!-- Respond.js and HTML shiv provide HTML5 support in older browsers like IE9 and 8 -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<script>
	var filter = "win16|win32|win64|mac|macintel"; 
	if ( navigator.platform ) { 
		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) { 
			window.location.href="http://222.236.46.37:8080/status/m_rgbList.do";
		}
	}

</script>
<body>

	<div class="loader-backdrop">
		<div class="loader"></div>
	</div>

	<header class="header-1">
		<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="col-sm-6" style="padding-top: 5px; padding-bottom: 5px;">
						<a href="http://kosc.kiost.ac.kr/"><img src="images/kosc_up.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>

		<nav class="navbar navbar-default">
			<!-- Navigation Bar -->
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navigation" aria-expanded="false">
						<span class="sr-only">Toggle Menu</span> <i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="#"> <br>
					</a>
				</div>

				<div class="collapse navbar-collapse" id="main-navigation">
					<!-- Main Menu -->
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="#">RGB</a></li>
						<li><a href="#">need to dev</a></li>
						<li><a href="#">need to dev</a></li>
						<li><a href="#">need to dev</a></li>
						<li><a href="#">need to dev</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="page-header">
		<div class="container">
			<h1>GOCI RGB Data</h1>
			<div class="breadcrumb-2">
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">RGB</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container mt-20 mb-20">
		<div class="row">
			<div class="col-sm-8">
				<h3>
					RGB Viewer. <br> <span class="color1">select a date</span>
				</h3>
				<p>Select the observation date and then choose the image you want to see. A date input field supports direct input and datepicker.</p>
				<form>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<input id="dPicker" class="form-control date-select" type="text" placeholder="Observation date ( MM/DD/YYYY )">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<select class="timeSelect" tabindex="-98" disabled="disabled">
									<option>Select Time</option>
								</select>
							</div>
						</div>
						<div class="col-sm-12">
							<fieldset>
								<legend>RGB Image</legend>
								<div class="row">
									<div class="col-sm-12">
										<div class="img-box">
											<a href="/status/orImg?path=${recentDate}&realName=${recentImage}" data-gal="prettyPhoto[galleryName]" class="img-open"><i class="fa fa-search-plus"></i></a> <img src="/status/smImg?path=${recentDate}&realName=${recentImage}" class="img-responsive" alt="">
										</div>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-4">
				<aside class="sidebar">
					<div class="widget widget-text">
						<h4 class="heading">Need Help?</h4>
						<p class="normal">In case of problems in using the site, please do let me know.</p>
						<p class="color1 bold">Tel : +82 31 400 6427</p>
						<p class="color1 bold">Email : byunghwa.son@kiost.ac.kr</p>
					</div>
				</aside>
			</div>
		</div>
	</div>

	<footer class="footer-1">
		<!-- Footer Style 1 -->
		<div class="footer-sec">
			<!-- Secondary Footer -->
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<span>&copy; 2017 All Rights Reserved. <a href="http://kosc.kiost.ac.kr/" target="_blank">KOSC</a></span>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<div id="back">
		<i class="fa fa-angle-up"></i>
	</div>

	<!-- JQuery Version 3.1.0 -->
	<script src="js/jquery.min.js" type="text/javascript"></script>

	<!-- Bootstrap Version 3.3.7 -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

	<!--Pretty Photo Version 3.1.6-->
	<script src="js/jquery.prettyPhoto.js" type=text/javascript></script>

	<!-- Owl Carousel 2.0.0 -->
	<script src="js/owl.carousel.min.js" type="text/javascript"></script>

	<!-- Bootstrap Select (Dropdown Styling) -->
	<script src="js/bootstrap-select.min.js" type="text/javascript"></script>

	<!-- jQuery UI (Date Picker) -->
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>

	<!-- Custom JS -->
	<script src="js/script.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			/* datePicker 허용 키 외 입력 방지 코드 */
			$("#dPicker").keydown(function(e) {
					console.log(e.keyCode);
				if (e.keyCode <= 57 && e.keyCode >= 48) { // qwerty 0-9 제외
					return;
				} else if (e.keyCode <= 105 && e.keyCode >= 96) { // 키패드 0-9 제외
					return;
				} else if (e.keyCode === 39 || e.keyCode === 37 || e.keyCode === 46 || e.keyCode === 8|| e.keyCode === 9){ // →, ←, del, backspace, tab 제외
					return
				} else { // 나머지 키 입력 방지
					e.stopPropagation();
					e.preventDefault();
					return false;
				}
			}).keyup(function(e) { // 2, 5번째마다  "/" 키 자동립력
				if(e.keyCode != 46 && e.keyCode != 8){
					if($(this).val().length === 2 || $(this).val().length === 5){
						$(this).val($(this).val()+"/");			
					}
				}
			});

			/* datePick 이후 노드 동적 생성 및 동적 이벤트 생성 */
			$(".hasDatepicker").change(function(event) {
				var date = "/" + $(this).val().split("/")[2] + $(this).val().split("/")[0] + "/" + $(this).val().split("/")[1] + "/";
				$.ajax({ // 날짜에 해당하는 사진 가져오는 ajax
					url : 'ajax/date',
					type : 'post',
					datatype : 'JSON',
					data : {
						path : date // date 값 json 으로 전달
					},
					success : function(json) {
						var $selectBar = $(".form-group > div > button");
						var $selectTime = $selectBar.children().eq(0);
						var data = JSON.parse(json);

						$selectBar.attr("title", "Select Time");
						$selectTime.html("Select Time");
						if (data.size === '1') { // 만약 데이터가 없다면 image select 불가능
							$(".timeSelect").attr("disabled", "disabled");
							$(".form-group > div").addClass("disabled");
							$(".form-group > div > button").addClass("disabled");
						} else { // 데이터가 있다면 image select 가능
							$(".timeSelect").removeAttr("disabled");
							$(".form-group > div").removeClass("disabled");
							$(".form-group > div > button").removeClass("disabled");
						}

						$("ul.dropdown-menu").html(data.menu);
						$('select').html(data.select);
						$('select').selectpicker();

						$(document).on("change", $selectTime, function(e) {
							var fileName = $selectTime.html();
							if (fileName !== 'Select Time') {
								$("div.img-box > a").attr("href", "/status/orImg?path=" + date + "&realName=" + $selectTime.html());
								$("div.img-box > img").attr("src", "/status/smImg?path=" + date + "&realName=" + $selectTime.html());
								
							} else {
// 								$("div.img-box > a").attr("href", "/status/orImg?path=" + date + "&realName=" + $selectTime.html());
// 								$("div.img-box > img").attr("src", "/status/smImg?path=" + date + "&realName=" + $selectTime.html());
							}
						});
					}
				})
			});
		});
	</script>
</body>

</html>