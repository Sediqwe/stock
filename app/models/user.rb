class User < ApplicationRecord
    has_secure_password
    before_save { self.username = username.downcase }
    validates :email, uniqueness: true
    validates :username, uniqueness: true, presence: true, length: {minimum: 5, maximum:100}
end
