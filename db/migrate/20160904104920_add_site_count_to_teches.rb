class AddSiteCountToTeches < ActiveRecord::Migration[5.0]
  def change
    add_column :teches, :site_count, :integer, default: 0
  end
end
