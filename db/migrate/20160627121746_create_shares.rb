class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :user
      t.datetime :date

      t.timestamps null: false
    end
  end
end
