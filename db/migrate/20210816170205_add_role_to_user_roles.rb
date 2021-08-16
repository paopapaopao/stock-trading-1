class AddRoleToUserRoles < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_roles, :role, null: false, foreign_key: true
  end
end
