class CreateRegistrars < ActiveRecord::Migration[5.0]
  def change
    create_table :registrars do |t|
      t.string :name
      t.string :url
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
