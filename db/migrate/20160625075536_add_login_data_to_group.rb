class AddLoginDataToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :auth_login, :string
    add_column :groups, :auth_password, :string
  end
end
