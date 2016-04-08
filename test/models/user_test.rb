require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'RDUser', lastname: 'RDLastname', 
                     email: 'rduser@rdcontacts.com', password: '12345',
                     password_confirmation: '12345')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should be less than 50 chars" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "lastname should be present" do
    @user.lastname = " "
    assert_not @user.valid?
  end

  test "lastname should be less than 50 chars" do
    @user.lastname = 'a' * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be less than 300 chars" do
    @user.email = 'a' * 301
    assert_not @user.valid?
  end

  test "email should be in a valid format" do
    invalid_email = %w[rduser@rdcontacts,com, rduser_at_rdcontacts_com, rduser@rdcontacts+rd.com, rduser@rdcontacts_domain.com]
    invalid_email.each do |invalid|
      @user.email = invalid
      assert_not @user.valid?, "#{invalid.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    second_user = @user.dup
    @user.save
    assert_not second_user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "password should be more than 5 chars" do
    @user.password = @user.password_confirmation = 'a' * 4
    assert_not @user.valid?
  end
end
