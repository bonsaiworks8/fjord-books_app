class ChangeColumnsAddNotNullOnBindingUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :binding_users, :follower_id, false
    change_column_null :binding_users, :followed_id, false
  end
end
