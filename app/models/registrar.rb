class Registrar < ApplicationRecord
  has_many :websites

  validates_presence_of :name
  validate :valid_url

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
