class AddDefaultValueToTimeZone < ActiveRecord::Migration[5.0]
  def up
  	change_column :users, :time_zone, :text, :default => "Pacific Time (US & Canada)"
  end

  def down
  	change_column :users, :time_zone, :text, :default => nil
  end
end
