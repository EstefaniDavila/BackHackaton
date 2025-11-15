class CreatePoliticalParties < ActiveRecord::Migration[7.1]
  def change
    create_table :political_parties, id: :uuid do |t|
      t.string :name
      t.string :logo
      t.string :website
      t.string :plan_pdf
      t.string :acronym
      t.string :hq_address
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url
      t.string :youtube_url
      t.string :tiktok_url

      t.text :description

      t.integer :status
      t.integer :members_count, default: 0

      t.date :founded_at

      t.timestamps
    end
    add_index :political_parties, :acronym, unique: true
  end
end
