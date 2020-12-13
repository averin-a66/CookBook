class UnitConvert < ApplicationRecord
  belongs_to :unit_from, class_name: 'Unit', :validate => true
  belongs_to :unit_to, class_name: 'Unit', :foreign_key => 'unit_to_id', :validate => true

  validates :ratio, presence: true
  #validates_with UnitConvertValidator

  def self.do_convert(unit_from, unit_to, value)
    if unit_from==unit_to
      return value
    else

    end
  end
end

class UnitConvertValidator < ActiveModel::Validator
  def validate(context)
    if context.unit_from.unit_kind != context.unit_to.unit_kind
      context.errors.add :base, 'классы единиц должны быть одинаковы'
    end
  end
end
