class CreateTeches < ActiveRecord::Migration[5.0]
  def change
    create_table :teches do |t|
      t.string :name
      t.string :org
      t.string :country
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
