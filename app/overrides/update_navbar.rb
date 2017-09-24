
Deface::Override.new(:virtual_path => 'spree/shared/_main_nav_bar',
	:name => 'update navbar',
	:replace_contents => '#main-nav-bar',
	:text => "
		<div class='container-fluid'>
			<div class='navbar-header'>
				<button type='button' class='navbar-toggle' data-toggle='collapse' data-target='#myNavbar'>
					<span class='icon-bar'></span>
					<span class='icon-bar'></span>
					<span class='icon-bar'></span>
				</button>
			</div>
			<div class='collapse navbar-collapse' id='myNavbar'>
				<ul id='nav-bar' class='nav navbar-nav navbar-right header-navbar-menu' data-hook>
				    <li id='search-bar' data-hook>
				      <%= render partial: 'spree/shared/search' %>
				    </li>
			  	</ul>
				<ul class='nav navbar-nav'>
					<li id='home-link' data-hook>
						<%= link_to 'HOME', spree.root_path %>
					</li>
					<li id='products-link' data-hook>
						<%= link_to 'PRODUCTS', spree.products_path %>
					</li>
					<li id='sizingchart-link' data-hook>
						<%= link_to 'SIZING CHART', spree.sizingchart_path %>
					</li>
					<li id='contactus-link' data-hook>
						<a href='/contact-us'>CONTACT US</a>
					</li>
					<li id='about-link' data-hook>
						<%= link_to 'ABOUT US', spree.about_path %>
					</li>
					<li id='faqs-link' data-hook>
						<%= link_to 'FAQs', spree.faqs_path %>
					</li>
				</ul>
				<ul class='nav navbar-nav navbar-right' data-hook>
			      <li id='link-to-cart' data-hook>
			        <noscript>
			          <%= link_to_cart %>
			        </noscript>
			        &nbsp;
			      </li>
			      <script>Spree.fetch_cart()</script>
			    </ul>
			</div>
		</div>
	")