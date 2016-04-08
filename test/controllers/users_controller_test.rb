require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @base_title = "RD Contacts | "
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", @base_title + "New account"
  end

end
