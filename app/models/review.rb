class Review < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates :rating, presence: :true
    validates :rating, numericality: {greater_than_or_equal_to: 0, less_than: 11}
    validates :movie_id, uniqueness: {scope: :user_id}

end
