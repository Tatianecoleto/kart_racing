class CreateLaps < ActiveRecord::Migration[5.2]
  def change
    create_table :laps do |t|
      t.integer :lap_number, null: false

      t.references :race, foreign_key: true, null: false
    end
  end
end
