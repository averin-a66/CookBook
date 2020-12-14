class UnitConvert < ApplicationRecord
  belongs_to :unit_from, class_name: 'Unit', :validate => true
  belongs_to :unit_to, class_name: 'Unit', :foreign_key => 'unit_to_id', :validate => true

  validates :ratio, presence: true
  #validates_with UnitConvertValidator

  def self.do_convert(unit_from, unit_system_to_id, value)
    unit_name = unit_from.name
    system_from_id = unit_from.unit_system_id

    # Если используется одна система единиц, возвращаем исходные значения
    if system_from_id == unit_system_to_id
      return value, unit_name, nil
    end
    # Выбираем прямые преобразования
    converts = Array.new
    UnitConvert.where('unit_from_id=? and unit_to_id in (select id from units where unit_system_id=? and unit_kind_id=?)', unit_from.id,unit_system_to_id,unit_from.unit_kind).each do |u|
      converts.push( {ratio: u.ratio, unit_name: u.unit_to.name } )
    end
    # Добавляем обратные преобразования
    UnitConvert.where('unit_to_id=? and unit_from_id in (select id from units where unit_system_id=? and unit_kind_id=?)', unit_from.id,unit_system_to_id,unit_from.unit_kind).each do |u|
      converts.push( {ratio: 1.0/u.ratio, unit_name: u.unit_from.name } )
    end

    # Если нет переобразования, возвращаем исходные значения
    if converts.length == 0
      return value, unit_name, nil
    end

    # Ищем приемлемое значение (не слишком маленькое и не слишком большое)
    # Если условие не выполнено, будет выведенно постеднее найденое значение
    v = value
    converts.each do |c|
      v = c[:ratio]*value
      unit_name = c[:unit_name]
      if v > 0.5 and v < 1000
        break
      end
    end

    return v, unit_name, converts
  end
end

class UnitConvertValidator < ActiveModel::Validator
  def validate(context)
    if context.unit_from.unit_kind != context.unit_to.unit_kind
      context.errors.add :base, 'классы единиц должны быть одинаковы'
    end
  end
end
