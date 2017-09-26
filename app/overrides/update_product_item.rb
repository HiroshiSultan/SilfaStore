
Deface::Override.new(:virtual_path => 'spree/products/_product',
	name: 'change the design of products',
	replace_contents: 'div.product-list-item',
	partial: 'spree/partials/update_product_item')