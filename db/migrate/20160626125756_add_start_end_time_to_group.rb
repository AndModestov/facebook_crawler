class AddStartEndTimeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :start_time, :datetime
    add_column :groups, :end_time, :datetime
  end
end
