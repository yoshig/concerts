class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer :band_id
      t.string :name

      t.timestamps
    end
  end
end
