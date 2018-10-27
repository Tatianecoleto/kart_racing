class CreateLapRacers < ActiveRecord::Migration[5.2]
  def change
    create_table :lap_racers do |t|
      t.integer :number_lap, null: false
      t.datetime :lap_time, null: false
      t.float :avg_speed, null: false

      t.references :racer, foreign_key: true, null: false
      t.references :lap, foreign_key: true, null: false
    end
  end
end
