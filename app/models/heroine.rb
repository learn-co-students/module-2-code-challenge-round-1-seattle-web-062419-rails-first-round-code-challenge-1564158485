class Heroine < ApplicationRecord
    validates :super_name, uniqueness: true
    has_one :power
end
