class Summoner < ApplicationRecord
    has_many :gpcs
    has_many :champions, through: :gpcs 
    has_many :games, through: :gpcs
end
