class CustomFieldInfo < ActiveRecord::Base
  belongs_to :contact
  belongs_to :custom_field

  # Validations
  validates :data, presence: true, length: { maximum: 150 }
end
