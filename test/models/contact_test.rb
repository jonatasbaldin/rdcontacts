require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:rduser)
    @contact = @user.contact.build(name: 'RDContact', 
                                    lastname: 'RDContactLastname', 
                                    email: 'rdcontact@rdcontacts.com',
                                    user_id: @user.id)
  end

  test "should be valid" do
    assert @contact.valid?
  end

  test "name should be present" do
    @contact.name = " "
    assert_not @contact.valid?
  end

  test "name should be less than 50 chars" do
    @contact.name = 'a' * 51
    assert_not @contact.valid?
  end

  test "lastname should be less than 50 chars" do
    @contact.lastname = 'a' * 51
    assert_not @contact.valid?
  end

  test "email should be present" do
    @contact.email = " "
    assert_not @contact.valid?
  end

  test "email should be less than 300 chars" do
    @contact.email = 'a' * 301
    assert_not @contact.valid?
  end

  test "email should be in a valid format" do
    invalid_email = %w[rdcontact@rdcontacts,com, rdcontact_at_rdcontacts_com, rdcontact@rdcontacts+rd.com, rdcontact@rdcontacts_domain.com]
    invalid_email.each do |invalid|
      @contact.email = invalid
      assert_not @contact.valid?, "#{invalid.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    second_contact = @contact.dup
    @contact.save
    assert_not second_contact.valid?
  end
  
end
