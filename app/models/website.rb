class Website < ApplicationRecord
  belongs_to :registrar
  belongs_to :tech
  belongs_to :admin
end
