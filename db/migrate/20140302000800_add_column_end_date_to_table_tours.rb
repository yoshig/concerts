class AddColumnEndDateToTableTours < ActiveRecord::Migration
  def change
    add_column :tours, :start_date, :date, default: Date.today
    add_column :tours, :end_date, :date, default: Date.today + 60
  end
end
