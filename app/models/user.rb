class User < ApplicationRecord
    
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: {maximum: 50 }
    VALID_RMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_RMAIL_REGEX},
    uniqueness: {case_sensitive: false}
    
    has_secure_password
end
