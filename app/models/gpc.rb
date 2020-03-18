class Gpc < ApplicationRecord
    belongs_to :game
    belongs_to :champion
    belongs_to :summoner

    has_and_belongs_to_many :masteries
    has_and_belongs_to_many :items

    has_many :gpcs_spells
    has_many :spells, through: :gpcs_spells
end
