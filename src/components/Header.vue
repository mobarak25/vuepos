<template>
	<header class="header">
		<nav class="navbar navbar-expand-lg">
			<router-link class="nav-link" to="/">Logo</router-link>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							File
						</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
							<div class="nester-dropdown">
								<a class="dropdown-item" href="#">Stock</a>
								<ul>
									<li>
										<router-link class="dropdown-item" to="/Add_Product">Add Product</router-link>	
									</li>
									<li>
										<router-link class="dropdown-item" :to="{name:'Sell_Out_Products'}">Sell out Products</router-link>
									</li>
									<li>
										<router-link class="dropdown-item" to="/All_Product">Available Produts</router-link>
									</li>
								</ul>
							</div>
							<router-link class="dropdown-item" :to="{name:'Search_Product'}">Search Product</router-link>
							<router-link class="dropdown-item" :to="{name:'Add_Product_Name'}">Product Name</router-link>
							<router-link class="dropdown-item" to="/Category">Categories</router-link>
							<a class="dropdown-item" href="#">Company</a>
							<a class="dropdown-item" href="#">Expense Detail</a>
							<a class="dropdown-item" href="#">Add Costomer</a>
							<a class="dropdown-item" href="#">Add Suppliers</a>
							<a class="dropdown-item" href="#">Exit</a>
						</div>
					</li>

					<li>
						<router-link class="nav-link" to="/pos">POS</router-link>
					</li>
					<li>
						<router-link class="nav-link" to="/#">Reposts</router-link>
					</li>
					<li>
						<router-link class="nav-link" to="/#">Help</router-link>
					</li>
					<li>
						<router-link class="nav-link" :to="{ name: 'Laundry' }">Laundry</router-link>
					</li>
				</ul>
			
			</div>
		</nav>
		
	</header>
</template>

<script>
	export default {
		data:function(){
			return {

			}
		}
	}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
