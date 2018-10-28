class CreateLapRacers < ActiveRecord::Migration[5.2]
  def change
    create_table :lap_racers do |t|
      t.datetime :lap_time, null: false
      t.float :lap_duration, null: false
      t.float :lap_speed, null: false

      t.references :racer, foreign_key: true, null: false
      t.references :lap, foreign_key: true, null: false
    end
  end
end
