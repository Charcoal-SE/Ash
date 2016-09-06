class Registrar < ApplicationRecord
  has_many :websites

  validate :valid_url

  validates :name, presence: true, uniqueness: { scope: [:url, :email, :phone] }

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
