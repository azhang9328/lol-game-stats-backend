class Mastery < ApplicationRecord
    has_and_belongs_to_many :gpcs
end
