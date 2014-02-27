class ChangeColumnToIsABand < ActiveRecord::Migration
  def change
    rename_column :users, :band, :is_a_band
  end
end
