class CreateRacers < ActiveRecord::Migration[5.2]
  def change
    create_table :racers do |t|
      t.integer :code, null: false
      t.string :name, null: false
    end
  end
end
