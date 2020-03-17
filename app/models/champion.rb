class Champion < ApplicationRecord
    has_many :gpc
    has_many :players, through: :gpc 
    has_many :games, through: :gpc
    has_many :skills
end
