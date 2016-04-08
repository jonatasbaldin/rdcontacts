require 'test_helper'

class CustomFieldTest < ActiveSupport::TestCase
  def setup
    @user = users(:rduser)
    @custom_field = @user.custom_field.build(name: 'RDCustomField', 
                                    style: 'text', 
                                    user_id: @user.id)
  end

  test "should be valid" do
    assert @custom_field.valid?
  end

  test "name should be present" do
    @custom_field.name = " "
    assert_not @custom_field.valid?
  end

  test "name should be less than 50 chars" do
    @custom_field.name = 'a' * 51
    assert_not @custom_field.valid?
  end

  test "style should be specifc" do
    valid_styles = %w[text text_area combobox]

    valid_styles.each do |valid|
      @custom_field.style = valid
      assert @custom_field.valid?
    end
  end

end
