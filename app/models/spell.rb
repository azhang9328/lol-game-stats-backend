class Spell < ApplicationRecord
    belongs_to :champion, optional: true
    has_many :gpcs_spells
    has_many :gpcs, through: :gpcs_spells
end
