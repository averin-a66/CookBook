class AddUnitKindToUnits < ActiveRecord::Migration[6.0]
  def change

    add_reference :units, :unit_kind, null: true, foreign_key: true
  end
end
