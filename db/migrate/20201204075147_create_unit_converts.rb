class CreateUnitConverts < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_converts do |t|
      t.references :unit_from, null: false, foreign_key: { to_table: :units }
      t.references :unit_to, null: false, foreign_key: { to_table: :units }
      t.float :ratio

      t.timestamps
    end
  end
end
