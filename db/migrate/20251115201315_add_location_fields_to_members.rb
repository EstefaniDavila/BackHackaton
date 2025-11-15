class AddLocationFieldsToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :department, :string
    add_column :members, :province, :string
    add_column :members, :district, :string
    add_column :members, :polling_place, :string
  end
end
