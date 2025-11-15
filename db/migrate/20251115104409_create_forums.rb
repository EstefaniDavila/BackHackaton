class CreateForums < ActiveRecord::Migration[7.1]
  def change
    create_table :forums, id: :uuid do |t|
      t.string :name

      t.references  :political_party,          null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
