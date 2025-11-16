class Post < ApplicationRecord
  has_one_attached :source
  belongs_to :political_party, optional: true

  def source_url
    Rails.application.routes.url_helpers.rails_blob_url(source, only_path: true) if source.attached?
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id title
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[political_party]
  end
end
