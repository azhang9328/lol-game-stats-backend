class Summoner < ApplicationRecord
    has_many :gpc
    has_many :champions, through: :gpc 
    has_many :games, through: :gpc
end
