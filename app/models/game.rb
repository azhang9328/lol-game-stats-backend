class Game < ApplicationRecord
    has_many :gpc
    has_many :champions, through: :gpc 
    has_many :summoners, through: :gpc
end
