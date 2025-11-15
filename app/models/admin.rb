class Admin < ApplicationRecord
  after_create :generate_user

  has_one :user, as: :roleable, dependent: :destroy

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
