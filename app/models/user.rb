class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
end
