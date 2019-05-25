<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>SmartWay | Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="static/sweetalert/src/sweetalert.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    

</head>
<body style="background-image:url(/static/images/Ba.jpg) ">
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">SmartWay</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="">Login</a></li>
					<li><a href="">Signup</a></li>
					<li><a href="/show-products">Products</a></li>
					<li><a href="/addProduct">Add Products</a></li>
					<li><a href="">Shopping Cart</a></li>
					<li><a href="">FeedBack</a></li>
					<li><a href="">Inventory</a></li>
				</ul>
			</div>
		</div>
	</div> 

<c:choose>
<c:when test="${mode=='MODE_HOME' }">
<div class="container"  >
		<div class="">
			<center>
			<h1><h1 style = "font-size:70px;"> Welcome to SmartWay</h1>
			<h2><h2 style="font-family:Vladimir Script;">Smarter Shopping, Better living..!</h2>
			</center>
		</div><br><br>
		
		
	<center>	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="/static/images/slide.jpg" alt="">
    </div>

    <div class="item">
      <img src="/static/images/slidee.jpg" alt="">
    </div>

    <div class="item">
      <img src="/static/images/slideee.jpg" alt="">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		
		</center>
		
	</div>
</c:when>

<c:when test="${mode=='MODE_ADDPRODUCT' }">
	<div class="container text-center">
				<h3>Add New Product</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-product">
					<input type="hidden" name="id" value="${product.id }" />
					
					
					<div class="form-group">
						<label class="control-label col-md-3">Item Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="itemName" placeholder = "Item Name" 
								value="${product.itemName }" required  />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Details</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="content" placeholder = "Details"
								value="${product.content }" required />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Price </label>
						<div class="col-md-3">
							<input type="number" class="form-control" name="price" placeholder = "Price" 
								value="${product.price }"  required />
						</div>
					</div>
					
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Add Product" />
						
						
					</div>
				</form>
			</div>
			</c:when>
			
			<c:when test="${mode=='ALL_PRODUCTS' }">
			
			<div class="container text-center" id="tasksDiv">
				<h3>All Products</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Item Name</th>
								<th>Content </th>
								<th>Price</th>
								<th>Delete</th>
								<th>Edit</th>
								<th>Add To Cart</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products }">
								<tr>
									<td>${product.id}</td>
									<td>${product.itemName}</td>
									<td>${product.content}</td>
									<td>${product.price}</td>
									<td><a href="/delete-product?id=${product.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-product?id=${product.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href=""><span
											class="glyphicon glyphicon-shopping-cart"></span></a></td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			</c:when>
			
			<c:when test="${mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Update Product</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-product">
					<input type="hidden" name="id" value="${product.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Item Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="itemName" 
								value="${product.itemName }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Content</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="content"
								value="${product.content }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Price</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="price"
								value="${product.price }" />
						</div>
					</div>
			
					
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>
			
			</c:choose>
	


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>									
	
</body>
</html>