class Item < ApplicationRecord
    has_many :gpcs_items
    has_many :gpcs, through: :gpcs_items
    validates :riot_id, uniqueness: true
end
