class AddTypeMemberToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :type_member, :integer
  end
end
