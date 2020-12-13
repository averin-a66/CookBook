class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :unit
  belongs_to :user
end
