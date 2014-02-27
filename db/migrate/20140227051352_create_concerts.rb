class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.integer :tour_id
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
