
Deface::Override.new(:virtual_path => 'spree/shared/_main_nav_bar',
	:name => 'update navbar',
	:replace_contents => '#main-nav-bar',
	:partial => "spree/partials/update_navbar")