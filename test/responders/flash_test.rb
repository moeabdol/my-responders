require "test_helper"

class FlashTest < ActionController::TestCase
  tests UsersController

  def set_authenticity_token
      session[:_csrf_token] = SecureRandom.base64(32)
  end

  test "sets notice message on successfull creation" do
    post :create, params: {
      user: { name: "John Doe" },
      authenticity_token: set_authenticity_token }
    assert_equal "User was successfully created.", flash[:notice]
  end

  test "sets notice message on successfull update" do
    user = User.create!(name: "John Doe")
    put :update, params: {
      id: user,
      user: { name: "Another John Doe" },
      authenticity_token: set_authenticity_token }
    assert_equal "User was successfully updated.", flash[:notice]
  end

  test "sets notice message on successful destroy" do
    user = User.create!(name: "John Doe")
    delete :destroy, params: {
      id: user,
      authenticity_token: set_authenticity_token }
    assert_equal "User was successfully destroyed.", flash[:notice]
  end

  test "sets alert message from the controller scope" do
    begin
      I18n.backend.store_translations :en,
        flash: { users: { destroy: { alert: "Cannot destroy!" } } }
      user = User.create!(name: "Undestroyable")
      delete :destroy, params: {
        id: user,
        authenticity_token: set_authenticity_token }
      assert_equal "Cannot destroy!", flash[:alert]
    ensure
      I18n.reload!
    end
  end
end
