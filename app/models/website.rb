class Website < ApplicationRecord
  belongs_to :registrar
  belongs_to :tech
  belongs_to :admin

  validate :valid_url

  validates :url, uniqueness: { scope: [:name_server] }

  private
    def valid_url
      if url.nil? || url.empty?
        return true
      end

      begin
        !URI.parse(url)
        return true
      rescue URI::InvalidURIError
        errors.add(:url, "doesn't appear to be a valid URL")
      end
    end
end
