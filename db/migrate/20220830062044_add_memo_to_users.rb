class AddMemoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_memo, :text
    add_column :users, :admin_memo, :text
  end
end
