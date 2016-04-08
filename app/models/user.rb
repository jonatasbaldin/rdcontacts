class User < ActiveRecord::Base
  # Save email in lowercase
  before_save { self.email = email.downcase }
  # Relations
  has_many :contact, dependent: :destroy
  has_many :custom_field, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 300 },
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # Allow nil for update action, has_secure_password prevents
  # creating an empty password at signup
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, 
                       allow_nil: true
end
