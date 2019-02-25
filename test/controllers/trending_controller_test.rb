require 'test_helper'

class TrendingControllerTest < ActionController::TestCase
  test "should get rank" do
    get :rank
    assert_response :success
  end

end
