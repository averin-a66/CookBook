class Unit < ApplicationRecord
  belongs_to :unit_system
  belongs_to :unit_kind

  validates :name, presence: true

  def self.obj_to_hash(filter)
    h = Hash.new
    Unit.where(filter).each do |o|
      h[o.id] = o.name + ' ['+o.unit_kind.name+']'
    end
    return h
  end
end
