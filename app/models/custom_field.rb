class CustomField < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :custom_field_info, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :style, presence: true
  validates_inclusion_of :style, in: %w[text text_area combobox], allow_nil: false

end
