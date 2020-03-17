class Item < ApplicationRecord
    has_and_belongs_to_many :gpcs
    validates :riot_id, uniqueness: true
end
