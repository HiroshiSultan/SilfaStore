
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

			  <script type='text/javascript'>
				function randomIntFromInterval(t,e){return Math.floor(Math.random()*(e-t+1)+t)}function myanimate(t,e){function s(){i>e?n--:n++,t.css('width',n+'%'),(n==e||0>=n||n>=100)&&clearInterval(a)}var n=0,r=parseInt(t.closest('.progressbar').css('width')),i=Math.floor(100*parseInt(t.css('width'))/r);i>e&&(n=i);var a=setInterval(s,40)}var total_items=50,d=new Date,min_items_left=8,max_items_left=12,remaining_items=randomIntFromInterval(min_items_left,max_items_left),min_of_remaining_items=4,decrease_after=.17,decrease_after_first_item=.007;!function(t){function e(t){var e=100*remaining_items/total_items;10>remaining_items&&t.find('.progressbar div:first').addClass('less-than-ten'),t.find('.progressbar').addClass('active progress-striped'),setTimeout(function(){myanimate(t.find('.progressbar div:first'),e),t.find('.progressbar').removeClass('active progress-striped')},1e3)}t.fn.progressbar=function(){var s='<p>Hurry! Only <span class='count'>'+remaining_items+'</span> left in stock.</p><div class='progressbar'><div style='width:100%'></div></div>';this.addClass('items-count'),this.html(s+this.html()),e(this);var n=this;setTimeout(function(){remaining_items--,t('.count').css('background-color','#CE0201'),t('.count').css('color','#fff'),setTimeout(function(){t('.count').css('background-color','#fff'),t('.count').css('color','#CE0201')},1800),n.find('.count').text(remaining_items),e(n)},6e4*decrease_after_first_item),setInterval(function(){remaining_items>min_of_remaining_items&&(remaining_items--,e(n)),t('.count').css('background-color','#CE0201'),t('.count').css('color','#fff'),setTimeout(function(){t('.count').css('background-color','#fff'),t('.count').css('color','#CE0201')},1800),n.find('.count').text(remaining_items)},6e4*decrease_after)}}(jQuery),jQuery.noConflict()(function(t){t(document).ready(function(){t('#progress_bar').progressbar();var e=('ctdn-12-12'.match(/\d+/g),t('#numdays')),s=t('#numhours'),n=t('#nummins'),r=t('#numsecs'),i=new Date,a=(i.getDay(),1),o=0,m=0,c=0,f=0-i.getSeconds();0>f&&(f=60-i.getSeconds(),o=1);var l=0-i.getMinutes()-o;0>l&&(l=60-i.getMinutes()-o,m=1);var u=14-i.getHours()-m;0>u&&(u=38-i.getHours()-m,c=1);var d=a-1;if(0>d){i.getMonth();d=30+a-i.getDate()-c}r.html(f),n.html(l),s.html(u),e.html(d);setInterval(function(){var t=r.text(),i=n.text(),a=s.text(),o=e.text();0==t&&0==i&&0==a&&0==o||(0==t&&0==i&&0==a?(e.html(o-1),s.html('23'),n.html('59'),r.html('59')):0==t&&0==i?(s.html(a-1),n.html('59'),r.html('59')):0==t?(n.html(i-1),r.html('59')):r.html(t-1))},1e3)})});
				</script>
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