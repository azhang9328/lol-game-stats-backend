class Gpc < ApplicationRecord
    belongs_to :game
    belongs_to :champion, optional: true
    belongs_to :summoner, optional: true

    has_many :gpcs_runes
    has_many :runes, through: :gpcs_runes
    
    has_many :gpcs_items
    has_many :items, through: :gpcs_items

    has_many :gpcs_spells
    has_many :spells, through: :gpcs_spells
end
