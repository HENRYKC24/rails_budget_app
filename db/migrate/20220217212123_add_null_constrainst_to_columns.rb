class AddNullConstrainstToColumns < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :name, false
    change_column_null :groups, :name, false
    change_column_null :groups, :icon, false
    change_column_null :entities, :name, false
    change_column_null :entities, :amount, false
  end
end
