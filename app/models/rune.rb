class Rune < ApplicationRecord
    has_many :gpcs_runes
    has_many :gpcs, through: :gpcs_runes
end
