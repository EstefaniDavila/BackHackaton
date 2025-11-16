class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: :uuid do |t|
      t.string :tittle
      t.datetime :date
      t.text :description
      t.references :political_party, null: true, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
