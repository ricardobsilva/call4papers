# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
  navigation.consider_item_names_as_safe = true
  navigation.renderer = SimpleNavigationRenderers::Bootstrap3
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', root_path
    primary.item :events, 'Eventos', events_path, if: proc { current_user.nil? }
    primary.item :events, 'Eventos', "#", unless: proc { current_user.nil? } do |events|
      events.item :all, "Todos os eventos", events_path
      events.item :new, "Novo Evento", new_event_path
      events.item :my_events, "Meus Eventos", my_events_path
    end
    primary.item :contact, 'Contato', contact_path
  end
end
