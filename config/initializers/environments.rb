Rails.env.on(:development) do |config|
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.i18n.available_locales = ["pt-BR", :en]
  config.i18n.default_locale = "pt-BR"
end

Rails.env.on(:test) do |config|
  config.i18n.available_locales = :en
  config.i18n.default_locale = :en
end
