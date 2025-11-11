class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members, id: :uuid do |t|
      t.string :first_name,       null: false, default: ""
      t.string :last_name,        null: false, default: ""
      t.string :full_name,        null: false, default: ""
      t.string :email,            null: false, default: ""
      t.string :document_number,  null: false, default: ""
      t.string :document_type,    null: false, default: ""
      t.integer :gender

      t.timestamps
    end

    add_index :members, :document_number, unique: true
  end
end
