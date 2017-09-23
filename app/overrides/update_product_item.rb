
Deface::Override.new(:virtual_path => 'spree/products/_product',
	name: 'change the design of products',
	replace_contents: 'div.product-list-item',
	text: 
		"<%= link_to url, itemprop: 'url' do %>
		<div class='panel panel-default'>
			<% cache(taxon.present? ? [I18n.locale, current_currency, taxon, product] : cache_key_for_product(product)) do %>
				<div class='panel-body text-center product-body'>
					
						<%= small_image(product, itemprop: 'image') %><br/>
					
					<br />
				</div>
				<div class='panel-footer text-center'>
					<div class='product-title'>
						<%= content_tag(:span, truncate(product.name, length: 50), class: 'info', itemprop: 'name', title: product.name) %><br />
					</div>
			        <span itemprop='offers' itemscope itemtype='https://schema.org/Offer'>
			          <span class='price selling lead' itemprop='price' content='<%= product.price_in(current_currency).amount.to_d %>'>
			            <%= display_price(product) %>
			          </span>
			          <span itemprop='priceCurrency' content='<%= current_currency %>'></span>
			        </span>
			    </div>
			<% end %>
		</div>
		<% end %>"
		)