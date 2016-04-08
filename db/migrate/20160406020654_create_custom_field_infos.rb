class CreateCustomFieldInfos < ActiveRecord::Migration
  def change
    create_table :custom_field_infos do |t|
      t.string :data
      t.references :contact, index: true, foreign_key: true
      t.references :custom_field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
