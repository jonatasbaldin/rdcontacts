require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:rduser)
  end

  test "invalid user signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: '', lastname: '',
                               email: 'email@invalid',
                               password: 'foo',
                               password_confirmation: 'bar' }
      
    end
    assert_equal '/users', path
  end

  test "valid user signup" do
  get signup_path
  assert_difference 'User.count', 1 do
    post users_path, user: { name: 'RDUser', lastname: 'RDUserLastname',
                     email: 'rduser@rdcontacts.com',
                     password: '123123',
                     password_confirmation: '123123' }
    end
    assert_redirected_to user_path(assigns(:user))
  end

  test "invalid login" do
    get login_path
    post login_path, session: { email: '', password: '' }
    assert_not flash.empty?
    assert_template 'sessions/new'
  end
  
  test "valid login" do
    get login_path
    post login_path, session: { email: @user.email, password: '12345' }
    assert_redirected_to user_path(@user)
    follow_redirect!
  end

end
