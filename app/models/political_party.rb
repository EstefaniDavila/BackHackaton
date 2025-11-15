class PoliticalParty < ApplicationRecord
  has_many :members, -> { where(role_member: Member.role_members[:party_representative]) },
           foreign_key: :political_party_id
  enum status: { pending: 0, approved: 1, rejected: 2 }

  after_commit :update_members_count

  private

  def update_members_count
    update_column(:members_count, members.count)
  end
end
