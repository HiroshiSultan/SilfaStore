
Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
	:name => 'change footer text',
	:insert_after => 'div.container',
	:partial => "spree/partials/update_footer")