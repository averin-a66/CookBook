class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :name
      t.references :unit_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
