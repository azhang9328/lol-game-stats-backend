class Champion < ApplicationRecord
    has_many :gpcs
    has_many :summoners, through: :gpcs 
    has_many :games, through: :gpcs
    has_many :spells
    has_one :passive
end
