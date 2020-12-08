class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :symbol
      t.references :unit_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
