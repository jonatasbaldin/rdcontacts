require 'test_helper'

class BaseControllerTest < ActionController::TestCase

  def setup
    @base_title = "RD Contacts | "
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", @base_title + "Keep your contacts with us!"
  end

end
