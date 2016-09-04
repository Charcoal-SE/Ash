class Tech < ApplicationRecord
  has_many :websites

  validates_presence_of :name
end
