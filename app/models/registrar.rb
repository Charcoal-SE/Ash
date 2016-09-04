class Registrar < ApplicationRecord
  has_many :websites

  validates_presence_of :name
end
