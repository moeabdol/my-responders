# require "action_controller"
require "action_controller/responder"
require "my_responders/flash"
require "my_responders/http_cache"

module MyResponders
  class AppResponder < ActionController::Responder
    include Flash
    include HttpCache
  end
end

# ActionController::Base.responder = MyResponders::AppResponder
require "active_support/i18n"
I18n.load_path << File.expand_path("../my_responders/locales/en.yml", __FILE__)
