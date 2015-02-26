SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |secondary|
    secondary.dom_class = 'nav navbar-nav navbar-right'
    secondary.item :login, 'Login', new_user_session_path, if: proc { current_user.nil? }
    unless current_user.nil?
      secondary.item :logged, current_user.name, "#", class: "nav navbar-nav" do |logged_sub_nav|
        logged_sub_nav.item :profile, 'Perfil', "#"
        logged_sub_nav.item :divider, "#", divider: true
        logged_sub_nav.item :divider, "Sessão", header: true
        logged_sub_nav.item :logout, 'Logout', destroy_user_session_path, method: :delete
      end
    end
  end
end
