class AddPoliticalPartyToMembers < ActiveRecord::Migration[7.1]
  def change
    add_reference :members, :political_party, null: true, foreign_key: true, type: :uuid
  end
end
