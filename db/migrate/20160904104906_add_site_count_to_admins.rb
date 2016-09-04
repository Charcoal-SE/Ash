class AddSiteCountToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :site_count, :integer, default: 0
  end
end
