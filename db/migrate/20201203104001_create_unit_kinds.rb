class CreateUnitKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_kinds do |t|
      t.string :name
      t.boolean :is_can_convert

      t.timestamps
    end
  end
end
