<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<!-- <meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

 -->
<!-- Bootstrap CSS -->

<title>Home</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">

<link href="/css/index.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "http://localhost:9192/category/getAll",
			dataType : 'json',
			cache : false,
			success : function(result) {

			},
			complete : function(result) {
				console.log(result.responseJSON)

				/* $.each(result.responseJSON, function(a, b) {
								console.log(a + " " + b);
								$(".dropdown-menu").append(
										'<a class="dropdown-item" href="#">'
												+ b["categoryName"] + '</a>');
							}); */
				console.log(result)
				console.log("hi " + result.responseJSON[0]["categoryName"])
			}

		});

	});
</script>

<style>
</style>
</head>
<body>


	<div class="caontiner">
		<!-- navigation bar start -->
		<nav class="navbar navbar-expand-lg"
			style="background-color: #dbdbdb;">
			<a class="navbar-brand" href="#"><span
				style="color: rgb(153, 40, 59); font-weight: bolder;">Proxi</span><span
				style="color: orange; font-weight: bolder;">Bid</span></a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon">=</span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<!-- <li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a>

					</li> -->
					<li class="nav-item 	dropdown" style="font-weight: bold;"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Categories </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">

							<c:forEach var="category" items="${categories}">
								<a class="dropdown-item" href="#">${category.categoryName}</a>
							</c:forEach>

							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">View all categories</a>
						</div></li>
				</ul>
				<form class="form-inline my-2 my-lg-0"
					style="color: rgb(153, 40, 59); font-weight: bold;">

					<a class="mr-3" href="#">Help</a> <a class="mr-3" href="#">Selling</a>
					<a class="mr-3" href="#">Buying</a> <a
						class=" my-3 my-sm-0 font-weight-bold"
						style="color: rgb(153, 40, 59); outline-color: rgb(153, 40, 59);"
						href="http://localhost:9192/bidder/login">Login</a>
				</form>
			</div>
		</nav>
		<!-- navigation bar end -->
		<div class="caontiner text-center"
			style="font-family: monospace; background-color: orange; color: rgb(153, 40, 59);">
			<h3>Bid, buy and enjoy!</h3>
		</div>
		<!-- carousel start -->
		<div class="container card banner">
			<div id="carouselExampleIndicators"
				class="carousel slide front-slider" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="/carousel/luxury.jpg" />
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="/carousel/ocala.jpg"
							alt="Second slide" />
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="/carousel/mcgrew.jpg" alt="">
						<!-- <div class="carousel-caption d-none d-md-block">
						<h5>Title</h5>
						<h3>
							<a href="#">View</a>
						</h3>
					</div> -->

					</div>
					<div class="d-block w-100" class="carousel-item">
						<img src="/carousel/nationwide.jpg" alt="">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

		</div>
		<!-- carousel end -->


		<!--auction items slider start -->



		<div class="container card"
			style="margin-top: 1em; background-color: #730808; color: white;">
			<h4>Featured Items</h4>

		</div>
		<div class="container text-center my-3 featured-items ">

			<div id="recipeCarousel" class="carousel slide w-100"
				data-ride="carousel">
				<div class="carousel-inner w-100" role="listbox">
					<div class="carousel-item row active" style="margin-right: 5px;">
						<c:forEach var="item" items="${auctionFourItems}">
							<div class="col-3 float-left card "
								style="height: 20em; margin: 1.1em; width: 15em;">
								<img class="img-fluid" src="/catalogimage/${item.itemImage}" />
								<h5>${item.itemName}</h5>
								<p>${auction.description}</p>
							</div>
						</c:forEach>
					</div>

					<c:forEach var="fourItems" items="${auctionItems}">
						<div class="carousel-item row">
							<c:forEach var="item" items="${fourItems}">
								<div class="col-3 float-left card"
									style="height: 20em; margin: 1.1em; width: 15em;">
									<img class="img-fluid" src="/catalogimage/${item.itemImage}" />
									<h5>${item.itemName}</h5>
									<p>${auction.description}</p>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
					<a class="carousel-control-prev" href="#recipeCarousel"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#recipeCarousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="container">
				<a href="#"
					style="font-size: 20px; font-weight: bold; float: right;"> View
					all</a>
			</div>
		</div>
		<!-- auction item slider end -->

		<br>

		<!--catalog items slider start -->
		<div class="container text-center my-3 top-items card">
			<div class="col-3 float-left"
				style="text-align: left; color: #730808;">
				<h2>Our Top Picks</h2>
			</div>

			<div id="recipeCarousel" class="carousel slide w-100"
				data-ride="carousel">
				<div class="carousel-inner w-100" role="listbox">
					<div class="carousel-item row active">
						<c:forEach var="item" items="${catalogItems}">
							<div class="col-3 float-left">
								<img class="img-fluid" src="/catalogimage/${item.itemImage}" />
								<h5>${item.itemName}</h5>
								<p>${auction.description}</p>
							</div>
						</c:forEach>
					</div>
				</div>
				<a class="carousel-control-prev" href="#recipeCarousel"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#recipeCarousel"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<button class="btn btn-warning" style="margin: 1em;">View
				All</button>
		</div>
		<!-- catalog item slider end -->






		<!--category items slider start -->
		<div class="container card"
			style="text-align: left; margin-top: 1em; background-color: #730808; color: white;">
			<h4>Choose a category</h4>
		</div>
		<div class="container text-center top-items ">
			<div id="recipeCarousel" class="carousel w-100" data-ride="carousel">
				<div class="carousel-inner w-100" role="listbox">
					<div class="carousel-item row active" style="margin: 5px;">
						<c:forEach var="item" items="${catalogFiveItems}">
							<div class="col-2 float-left card"
								style="height: 15em; margin-right: 2em">
								<img class="img-fluid" style="margin-top: 1px"
									src="/catalogimage/${item.itemImage}" />
								<p class="text-truncate">${item.itemName}</p>
							</div>
						</c:forEach>
						<div class="card col-2 " style="margin: 1em; float: right;">
							<a href=""> More categories</a>
						</div>
					</div>
				</div>
			</div>



		</div>
		<!-- category item slider end -->


		<!-- Footer -->
		<footer class="text-center text-lg-start bg-light text-muted">
			<!-- Section: Social media -->
			<section
				class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
				style="background-color: #dbdbdb;">
				<!-- Left -->
				<div class="me-5 d-none d-lg-block">
					<span>Get connected with us on social networks:</span>
				</div>
				<!-- Left -->

				<!-- Right -->
				<div>
					<a href="" class="me-4 text-reset"> <i
						class="fab fa-facebook-f"></i>
					</a> <a href="" class="me-4 text-reset"> <i class="fab fa-twitter"></i>
					</a> <a href="" class="me-4 text-reset"> <i class="fab fa-google"></i>
					</a> <a href="" class="me-4 text-reset"> <i
						class="fab fa-instagram"></i>
					</a> <a href="" class="me-4 text-reset"> <i class="fab fa-linkedin"></i>
					</a> <a href="" class="me-4 text-reset"> <i class="fab fa-github"></i>
					</a>
				</div>
				<!-- Right -->
			</section>
			<!-- Section: Social media -->

			<!-- Section: Links  -->
			<section class="" style="background-color: #dbdbdb;">
				<div class="container text-center text-md-start ">
					<!-- Grid row -->
					<div class="row">
						<!-- Grid column -->
						<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
							<!-- Content -->
							<h6 class="text-uppercase fw-bold mb-4">
								<i class="fas fa-gem me-3"></i>Proxobid
							</h6>
							<p>Bid, buy and enjoy!</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">About</h6>
							<p>
								<a href="#!" class="text-reset">About us</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Newsletter</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Careers</a>
							</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">Buying & Selling</h6>
							<p>
								<a href="#!" class="text-reset">Seller Log in</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Buyer Sign Up</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Apply To Sell</a>
							</p>

						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
							<p>
								<i class="fas fa-home me-3"></i> New York, NY 10012, US
							</p>
							<p>
								<i class="fas fa-envelope me-3"></i> info@example.com
							</p>
							<p>
								<i class="fas fa-phone me-3"></i> + 01 234 567 88
							</p>
							<p>
								<i class="fas fa-print me-3"></i> + 01 234 567 89
							</p>
						</div>
						<!-- Grid column -->
					</div>
					<!-- Grid row -->
				</div>
			</section>
			<!-- Section: Links  -->

			<!-- Copyright -->
			<div class="text-center p-4"
				style="background-color: rgba(0, 0, 0, 0.05);">
				© 2022 Copyright: <a class="text-reset fw-bold"
					href="https://localhost:9192/">Prixibid.com</a>
			</div>
			<!-- Copyright -->
		</footer>
		<!-- Footer -->

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>


	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>
