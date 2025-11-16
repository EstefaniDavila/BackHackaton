class Post < ApplicationRecord
  has_one_attached :source
  has_one :political_party, optional: true

  private

  def source_url
    Rails.application.routes.url_helpers.rails_blob_url(source, only_path: true) if source.attached?
  end

end
