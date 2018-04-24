class AddDefaultValueForClick < ActiveRecord::Migration[5.1]
  def change
    change_column :urls, :click, :integer, :default => 0
  end
end
