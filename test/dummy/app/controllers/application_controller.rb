class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  self.responder = MyResponders::AppResponder
end
