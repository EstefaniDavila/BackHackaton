class CreateCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :candidates, id: :uuid do |t|
      t.string :full_name, null: false
      t.string :document_number, null: true
      t.string :photo_url

      t.integer :position_type, null: false    # PRESI, VICE, SENADO, DIPUTADO, ANDINO
      t.integer :role, null: false             # TITULAR o REEMPLAZANTE
      t.string :circumscription                 # Nacional, Lima, Arequipa…
      t.integer :order_number                   # Número en lista

      t.uuid :political_party_id, null: false

      t.timestamps
    end

    add_index :candidates, :position_type
    add_index :candidates, :political_party_id
  end
end
