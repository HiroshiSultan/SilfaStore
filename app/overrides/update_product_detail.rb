
Deface::Override.new(virtual_path: 'spree/products/show',
	name: 'Change the design of product detail',
	replace_contents: "[data-hook='product_show']",
	text: "
		<div class='col-md-4 col-sm-5' data-hook='product_left_part' id='product_left_part'>
			<div data-hook='product_left_part_wrap'>
				<div id='product-images' data-hook='product_images'>
					<div id='main-image' class='panel panel-default' data-hook>
			            <div class='panel-body text-center'>
			              	<%= product_image(@product, itemprop: 'image') %>
			            </div>
			        </div>
			        <div id='thumbnails' data-hook>
			            <%= render partial: 'thumbnails' %>
			        </div>
				</div>
			</div>
		</div>

		<div class='col-md-8 col-sm-7' data-hook='product_right_part' id='product_right_part'>
	      <div data-hook='product_right_part_wrap'>
	        
	        <div id='product-description' data-hook='product_description'>
	          <h1 class='product-title' itemprop='name'><%= @product.name %></h1>

	          <% if @product.price_in(current_currency) && !@product.price.nil? %>
			      <div data-hook='product_price' class='col-md-12' style='padding: 0px 0px 30px 0px'>
			        <div id='product-price'>
			            <span class='lead price selling' itemprop='price' content='<%= @product.price_in(current_currency).amount.to_d %>'>
			              <%= display_price(@product) %>
			            </span>
			            <span itemprop='priceCurrency' content='<%= current_currency %>'></span>
			        </div>
			      </div>
			  <% end %>

			  <div class='items-count'>
			  		<p><strong>HURRY! ONLY <span id='number_of_remains' style='color: red'>4</span> LEFT IN STOCK.</strong></p>
			  		<div class='count count-progress-bar'>
			  			<div class='count count-remains'>

			  			</div>
			  		</div>
			  </div>

			  <div id='clock-ticker' class='clearfix'>
			  		<div id='clock-ticker-days' class='block'>
			  			<span id='days' class='while'>0</span>
			  			<span class='unit'>DAYS</span>
			  		</div>
			  		<div id='clock-ticker-hours' class='block'>
			  			<span id='hours' class='while'>18</span>
			  			<span class='unit'>HOURS</span>
			  		</div>
			  		<div id='clock-ticker-mins' class='block'>
			  			<span id='mins' class='while'>23</span>
			  			<span class='unit'>MINUTES</span>
			  		</div>
			  		<div id='clock-ticker-secs' class='block'>
			  			<span id='secs' class='while'>39</span>
			  			<span class='unit'>SECONDS</span>
			  		</div>
			  </div>
<!--
				
-->
				<div id='cart-form' data-hook='cart_form'>
		            <%= render partial: '../views/layouts/cart_form' %>
		        </div>

	        	<div id='checkout_image' class='images'>
	        		<img src='https://cdn.shopify.com/s/files/1/2006/5911/t/4/assets/safe-checkout.jpg?8653084382372939891' alt='Checkout Image' />
	        	</div>

	        	<div id='feedbacks-description' class='images'>
					<img src='https://cdn.shopify.com/s/files/1/1511/6512/files/Screen_Shot_2017-03-31_at_11.59.18_large.png?v=1490951137' alt='feedbacks of customers' />	        		
	        		<img src='https://cdn.shopify.com/s/files/1/1511/6512/files/Screen_Shot_2017-03-31_at_11.59.52_large.png?v=1490951122' alt='feedbacks of customers' />
	        		<img src='https://cdn.shopify.com/s/files/1/1511/6512/files/Screen_Shot_2017-03-04_at_22.21.45_large.png?v=1488659395' alt='feedbacks of customers' />
	        		<img src='https://cdn.shopify.com/s/files/1/1511/6512/files/aa_large.png?v=1480110010' alt='description' />
	        		<img src='https://cdn.shopify.com/s/files/1/1511/6512/files/yes_large_large.jpg?v=1480110059' alt='description' />
	        	</div>

	        	<div class='satisfaction' style='width: 100%'>
	        		<p>Unhappy With Your Product? We’ll Take It Back!<br>
					   We stand by our high-quality products and your satisfaction is 100% guaranteed
					</p>
	        	</div>

	        	<div class='social-sharing' data-permalink='https://sparkjumps.com/products/bikers-fleece-jacket'>
	        		<a target='_blank' href='https://www.facebook.com/sharer.php?u=https://sparkjumps.com/products/bikers-fleece-jacket' class='share-facebook btn btn-primary' title='Share on Facebook'>
	        			<i class='fa fa-facebook-square' aria-hidden='true'></i>
	        			Share
	        		</a>
	        		<a target='_blank' href='https://twitter.com/share?text=Bikers%20Jacket%20%20-%2050%25%20OFF%20-%20LIMITED%20EDITION&url=https://sparkjumps.com/products/bikers-fleece-jacket&source=webclient' class='share-twitter btn btn-success' title='Tweet on Twitter'>
	        			<i class='fa fa-twitter' aria-hidden='true'></i>
	        			Tweet
	        		</a>
	        		<a target='_blank' href='https://pinterest.com/pin/create/button/?url=https://sparkjumps.com/products/bikers-fleece-jacket&media=http://cdn.shopify.com/s/files/1/2006/5911/products/RWY271_Grey_1024x1024.jpg?v=1499547640&description=Bikers%20Jacket%20%20-%2050%25%20OFF%20-%20LIMITED%20EDITION' class='share-pinterest btn btn-warning' title='Pin on Pinterest'>
	        			<i class='fa fa-pinterest' aria-hidden='true'></i>
	        			Pin it
	        		</a>
	        	</div>
	        </div>

	      </div>
	    </div>
	")