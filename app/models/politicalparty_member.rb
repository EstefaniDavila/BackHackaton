class PoliticalpartyMember < ApplicationRecord
  belongs_to :political_party
  has_many :members, through :politicalparty_members
  # def self.ransackable_attributes(auth_object = nil)
  #   %w[status created_at updated_at]
  # end

  def self.ransackable_associations(auth_object = nil)
    ["professor", "program", "contract"] 
  end
end
