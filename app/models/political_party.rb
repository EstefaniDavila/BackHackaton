class PoliticalParty < ApplicationRecord
  belongs_to :member
  has_one_attached :logo
  has_one_attached :plan_pdf
  has_one :forum, dependent: :destroy
  # has_many :members, -> { where(role_member: Member.role_members[:party_representative]) },
  #          foreign_key: :political_party_id
  enum status: { active: 0, inactive: 1 }
  has_many :members, through: :politicalparty_members

  before_destroy :purge_attachments_and_forum
  after_commit :create_default_forum, on: :create

  # after_commit :update_members_count

  private

  def create_default_forum
    create_forum!(name: "#{name} Forum")
  rescue => e
    Rails.logger.error "No se pudo crear el foro: #{e.message}"
    puts "No se pudo crear el foro: #{e.message}"  # útil para consola/IRB
  end

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
    forum.destroy if forum.present?
  end
end
