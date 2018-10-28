class CreateLaps < ActiveRecord::Migration[5.2]
  def change
    create_table :laps do |t|
      t.integer :lap_number, null: false
    end
  end
end
