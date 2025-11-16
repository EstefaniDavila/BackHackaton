class MakePoliticalPartyIdNullableInPosts < ActiveRecord::Migration[7.1]
  def change
        change_column_null :posts, :political_party_id, true
  end
end
