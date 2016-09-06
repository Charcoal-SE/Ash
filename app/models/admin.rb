class Admin < ApplicationRecord
  has_many :websites

  validates :name, presence: true, uniqueness: { scope: [:org, :country, :email, :phone] }
end
