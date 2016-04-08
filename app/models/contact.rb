class Contact < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :custom_field_info
  accepts_nested_attributes_for :custom_field_info

  # Validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :lastname, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 300 },
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
