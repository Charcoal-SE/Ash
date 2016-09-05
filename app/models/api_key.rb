class ApiKey < ApplicationRecord
  belongs_to :user

  validates :key, uniqueness: true
  validates :app_name, uniqueness: true
end
