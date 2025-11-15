class PoliticalParty < ApplicationRecord
  has_many :members, -> { where(role_member: Member.role_members[:party_representative]) },
           foreign_key: :political_party_id
  enum status: { active: 0, inactive: 1 }

  after_commit :update_members_count

  private

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id name acronym
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[ members ]
  end

  def update_members_count
    update_column(:members_count, members.count)
  end
end
