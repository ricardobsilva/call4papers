# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
  navigation.consider_item_names_as_safe = true
  navigation.renderer = SimpleNavigationRenderers::Bootstrap3
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', root_path
    primary.item :events, 'Eventos', events_path
    primary.item :contact, 'Contato', contact_path
  end
end
