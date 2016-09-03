class AddAssociationsToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_reference :websites, :registrar, foreign_key: true
    add_reference :websites, :admin, foreign_key: true
    add_reference :websites, :tech, foreign_key: true
  end
end
