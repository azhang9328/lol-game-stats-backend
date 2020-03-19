class Game < ApplicationRecord
    has_many :gpcs
    has_many :champions, through: :gpcs 
    has_many :summoners, through: :gpcs
end
