class Recipe < ApplicationRecord
  belongs_to :user
  has_many :coments
  has_many :ingredients
end
