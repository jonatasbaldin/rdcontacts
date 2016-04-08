class CustomFields < ActiveRecord::Migration
  def change
    change_column :custom_fields, :style, :string
  end
end
