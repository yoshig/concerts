class AddBandBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :band, :boolean, default: false
  end
end
