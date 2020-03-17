class Gpc < ApplicationRecord
    belongs_to :game
    belongs_to :champion
    belongs_to :player

    has_and_belongs_to_many :masteries
    has_and_belongs_to_many :items
end
