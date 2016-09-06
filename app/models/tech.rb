class Tech < ApplicationRecord
  has_many :websites

  validate :name, presence: true, uniqueness: { scope: [:org, :country, :email, :phone] }
end
