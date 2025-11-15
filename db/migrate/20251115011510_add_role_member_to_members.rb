class AddRoleMemberToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :role_member, :integer
  end
end
