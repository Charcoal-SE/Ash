class AddNameServerToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :name_server, :string
  end
end
