class Champion < ApplicationRecord
    has_many :gpc
    has_many :summoners, through: :gpc 
    has_many :games, through: :gpc
    has_many :spells
    has_one :passive
end
