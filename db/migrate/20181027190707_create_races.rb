class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name, null: false
      t.datetime :best_lap
    end
  end
end
