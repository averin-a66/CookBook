class State < ApplicationRecord
  belongs_to :unit_system
  validates :name, presence: true
end
