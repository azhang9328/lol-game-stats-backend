class Game < ApplicationRecord
    has_many :gpc
    has_many :champions, through: :gpc 
    has_many :players, through: :gpc
end
