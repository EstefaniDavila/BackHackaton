class PoliticalParty < ApplicationRecord
  before_destroy :purge_attachments_and_forum

  belongs_to :member

  has_one_attached :logo
  has_one_attached :plan_pdf

  has_many :members, through: :politicalparty_members
  has_many :candidates, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  belongs_to :member, optional: true


  enum status: { active: 0, inactive: 1 }
  
  private

  def logo_url
    Rails.application.routes.url_helpers.rails_blob_url(logo, only_path: true) if logo.attached?
  end


  def plan_pdf_url
    Rails.application.routes.url_helpers.rails_blob_url(plan_pdf, only_path: true) if plan_pdf.attached?
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id name acronym
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[ member ]
  end

  def update_members_count
    update_column(:members_count, members.count)
  end

  def purge_attachments_and_forum
    logo.purge_later if logo.attached?
    plan_pdf.purge_later if plan_pdf.attached?
  end
end
