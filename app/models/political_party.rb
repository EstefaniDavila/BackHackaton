class PoliticalParty < ApplicationRecord
    has_many :members, -> { where(role_member: :party_representative) }
    enum status: {pending: 0,approved: 1,rejected: 2}

  after_commit :update_members_count

  private

  def update_members_count
    update_column(:members_count, members.count)
  end
end
