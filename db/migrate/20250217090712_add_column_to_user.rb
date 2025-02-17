class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :string, default: "member"
    add_column :users, :name, :string
  end
end
