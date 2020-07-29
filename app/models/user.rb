class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
    validates :name, :username, presence: :true


    has_secure_password
end
