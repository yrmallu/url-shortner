class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text :url
      t.string :url_id
      t.boolean :status

      t.timestamps
    end
  end
end
