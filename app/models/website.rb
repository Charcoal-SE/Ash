class Website < ApplicationRecord
  belongs_to :registrar
  belongs_to :tech
  belongs_to :admin

  validate :valid_url

  private
    def valid_url
      if !URI.parse(url)
        errors.add(:url, "doesn't appear to be a valid URL")
      end
    end
end
