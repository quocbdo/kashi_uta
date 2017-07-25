class User < ApplicationRecord
    has_many :songs
    has_secure_password
    validates :email, presence: true, uniqueness: true
end
