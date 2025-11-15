class Member < ApplicationRecord
  after_create :generate_user
  has_one :user, as: :roleable, dependent: :destroy
  
  has_many :members, through: :politicalparty_members

  enum role_member: {citizen: 0,mesa_member: 1,party_representative: 2}
  enum gender: { male: 0, female: 1, other: 2 }

  private
  
  def generate_user
    User.create!(
      email: email,
      document_number: document_number,
      password: document_number,
      password_confirmation: document_number,
      roleable: self
    )
  end
end
