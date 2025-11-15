class Member < ApplicationRecord
  after_create :generate_user
  has_one :user, as: :roleable, dependent: :destroy
  belongs_to :political_party, optional: true

 enum role_member: {citizen: 0,mesa_member: 1,party_representative: 2}
 enum gender: { male: 0, female: 1 }

  private
  def generate_user
    User.create!(
      email: self.email,
      document_number: self.document_number,
      password: self.document_number,
      password_confirmation: self.document_number,
      roleable: self
    )
  end

end
