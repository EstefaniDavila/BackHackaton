class CreatePoliticalpartyMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :politicalparty_members do |t|
      t.belongs_to :political_party, null: false, foreign_key: true, type: :uuid
      t.belongs_to :member, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
