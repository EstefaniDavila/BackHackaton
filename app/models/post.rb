class Post < ApplicationRecord
  has_one_attached :source
  belongs_to :forum


  private

  def source_url
    Rails.application.routes.url_helpers.rails_blob_url(source, only_path: true) if source.attached?
  end

end
