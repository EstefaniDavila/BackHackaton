class AddTypeMemberToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :type_member, :integer
  end
end
