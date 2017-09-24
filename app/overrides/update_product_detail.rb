
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

			  <style>#progress_bar{margin-top:15px}.progressbar.progressbar{background:#ffe8e8;border:0px solid whitesmoke;height:11px}.progressbar.progressbar div{background:#d95350;height:11px}.progressbar.progressbar.active div{-webkit-animation:2s linear 0s normal none infinite running progress-bar-stripes;animation:2s linear 0s normal none infinite running progress-bar-stripes}.progress-striped.progressbar.progressbar div{background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, rgba(0, 0, 0, 0) 25%, rgba(0, 0, 0, 0) 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0));background-size:40px 40px}.items-count{margin-top:0px;margin-bottom:0px}.count{color:#a94442;padding:1px}.items-count p{padding-bottom:5px;margin:0;text-transform:uppercase;font-weight:700;text-align:center;font-family:'Open Sans',Arial,sans-serif}.progressbar{position:relative;display:block;background-color:#ca0000;border:1px solid #ddd;margin-bottom:15px;-webkit-box-shadow:inset 0 1px 2px rgba(0, 0, 0, .1);box-shadow:inset 0 1px 2px rgba(0, 0, 0, .1)}.progressbar > div{background-color:#ca0000;width:0;margin-bottom:0;height:15px}.progressbar > div.less-than-ten{background-color:#ca0000 !important}#clock-ticker{display:block;margin-bottom:15px}#clock-ticker .block{position:relative;color:#000;font-weight:bold;float:left;text-align:center;width:25%}#clock-ticker .block .flip-top{width:88px;height:39px;line-height:40px;font-size:40px;text-align:center}#clock-ticker .block .label,span.flip-top{color:#000;font-weight:bold;text-align:center;font-size:14px;text-transform:uppercase;width:88px;line-height:25px;font-family:'Open Sans',Arial,sans-serif}</style>


<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>

<script type='text/javascript'>
function randomIntFromInterval(min, max) {return Math.floor(Math.random() * (max - min + 1) + min);}

// Settings are here
var total_items = 50;
var d = new Date();
var min_items_left = 12;
var max_items_left = 20;
var remaining_items = randomIntFromInterval(min_items_left, max_items_left);
var min_of_remaining_items = 1;
var decrease_after = 1.7; 
var decrease_after_first_item = 0.17; 

// Davy Jones' Locker
(function($){$.fn.progressbar=function(){var a='<p>Hurry! Only <span class='count'>'+remaining_items+'</span> left in stock.</p>'+'<div class='progressbar'><div style='width:100%'></div></div>';this.addClass('items-count');this.html(a+this.html());updateMeter(this);var b=this;setTimeout(function(){remaining_items--;if(remaining_items<min_of_remaining_items){remaining_items=randomIntFromInterval(min_items_left,max_items_left)}$('.count').css('background-color','#CE0201');$('.count').css('color','#fff');setTimeout(function(){$('.count').css('background-color','#fff');$('.count').css('color','#CE0201')},1000*60*0.03);b.find('.count').text(remaining_items);updateMeter(b)},1000*60*decrease_after_first_item);setInterval(function(){remaining_items--;if(remaining_items<min_of_remaining_items){remaining_items=randomIntFromInterval(min_items_left,max_items_left)}$('.count').css('background-color','#CE0201');$('.count').css('color','#fff');setTimeout(function(){$('.count').css('background-color','#fff');$('.count').css('color','#CE0201')},1000*60*0.03);b.find('.count').text(remaining_items);updateMeter(b)},1000*60*decrease_after)};function updateMeter(a){var b=100*remaining_items/total_items;if(remaining_items<10){a.find('.progressbar div:first').addClass('less-than-ten')}a.find('.progressbar').addClass('active progress-striped');setTimeout(function(){myanimate(a.find('.progressbar div:first'),b);a.find('.progressbar').removeClass('active progress-striped')},1000)}}(jQuery));function myanimate(a,b){var c=0;var d=parseInt(a.closest('.progressbar').css('width'));var e=Math.floor(100*parseInt(a.css('width'))/d);if(e>b){c=e}function frame(){if(e>b){c--}else{c++}a.css('width',c+'%');if(c==b||c<=0||c>=100)clearInterval(f)}var f=setInterval(frame,40)} jQuery.noConflict()(function($){$(document).ready(function(){$('#progress_bar').progressbar();var tag='ctdn-12-12'.match(/\d+/g);var hour=14;var theDaysBox=$('#numdays');var theHoursBox=$('#numhours');var theMinsBox=$('#nummins');var theSecsBox=$('#numsecs');var d=new Date();var n=d.getDay();var date=1;var gg=0;var hh=0;var ii=0;var nsec=0-d.getSeconds();if(nsec<0){nsec=60-d.getSeconds();gg=1}var nmin=0-d.getMinutes()-gg;if(nmin<0){nmin=60-d.getMinutes()-gg;hh=1}var nhrs=14-d.getHours()-hh;if(nhrs<0){nhrs=38-d.getHours()-hh;ii=1}var ndat=date-1;if(ndat<0){var mmon=d.getMonth();ndat=30+date-d.getDate()-ii}theSecsBox.html(nsec);theMinsBox.html(nmin);theHoursBox.html(nhrs);theDaysBox.html(ndat);var refreshId=setInterval(function(){var e=theSecsBox.text();var a=theMinsBox.text();var c=theHoursBox.text();var b=theDaysBox.text();if(e==0&&a==0&&c==0&&b==0){}else{if(e==0&&a==0&&c==0){theDaysBox.html(b-1);theHoursBox.html('23');theMinsBox.html('59');theSecsBox.html('59')}else{if(e==0&&a==0){theHoursBox.html(c-1);theMinsBox.html('59');theSecsBox.html('59')}else{if(e==0){theMinsBox.html(a-1);theSecsBox.html('59')}else{theSecsBox.html(e-1)}}}}},1000);});});</script>
<div class='items-count' id='progress_bar'></div><div id='clock-ticker' class='clearfix'><div class='block'><span class='flip-top' id='numdays'>0</span><br><span class='label'>Days</span></div><div class='block'><span class='flip-top' id='numhours'>1</span><br><span class='label'>Hours</span></div><div class='block'><span class='flip-top' id='nummins'>23</span><br><span class='label'>Minutes</span></div><div class='block'><span class='flip-top' id='numsecs'>36</span><br><span class='label'>Seconds</span></div>
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