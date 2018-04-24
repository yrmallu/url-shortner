class AddDefaultValueForStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :urls, :status, :boolean, :default => false
  end
end
