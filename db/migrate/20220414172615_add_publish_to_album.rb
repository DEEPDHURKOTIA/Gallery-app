class AddPublishToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :publish, :boolean
  end
end
