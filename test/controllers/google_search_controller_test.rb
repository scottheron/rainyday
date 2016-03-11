require 'test_helper'

class GoogleSearchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
