class CreateCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :document_number
      t.string :document_type
      t.integer :gender
      t.string :department
      t.string :province
      t.string :district
      t.string :position
      t.string :list_number
      t.string :photo_url
      t.string :cv_pdf
      t.uuid :political_party_id

      t.timestamps
    end
  end
end
