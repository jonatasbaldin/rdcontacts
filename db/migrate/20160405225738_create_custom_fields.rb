class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.integer :style
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
