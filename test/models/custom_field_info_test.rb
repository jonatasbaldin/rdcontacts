require 'test_helper'

class CustomFieldInfoTest < ActiveSupport::TestCase
  def setup
    @contact = contacts(:rdcontact)
    @custom_field = custom_fields(:rdcustomfield)
    @custom_field_info = @contact.custom_field_info.build(data: 'some data', 
                                                          contact_id: @contact.id,
                                                          custom_field_id: @custom_field.id)
            

  end

  test "shoud be valid" do
    @custom_field_info.valid?
  end

  test "data should be present" do
    @custom_field_info.data = " "
    assert_not @custom_field_info.valid?
  end

  test "data should be less than 150 chars" do
    @custom_field_info.data = 'a' * 151
    assert_not @custom_field_info.valid?
  end
end
