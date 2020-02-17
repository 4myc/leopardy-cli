class Question < ActiveRecord::Base
    has_many :games
    has_many :answers
    has_many :players, through: :games
end