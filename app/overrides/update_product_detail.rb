
Deface::Override.new(virtual_path: 'spree/products/show',
	name: 'Change the design of product detail',
	replace_contents: "[data-hook='product_show']",
	partial: "spree/partials/update_product_detail")
