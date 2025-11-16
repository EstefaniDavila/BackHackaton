class AddAffiliatesRopToPoliticalParties < ActiveRecord::Migration[7.1]
  def change
    add_column :political_parties, :affiliates_rop, :integer
  end
end
