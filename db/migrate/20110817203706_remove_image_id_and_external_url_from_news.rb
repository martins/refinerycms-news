class RemoveImageIdAndExternalUrlFromNews < ActiveRecord::Migration[4.2]
  def change
    remove_column :refinery_news_items, :external_url, :string
    remove_column :refinery_news_items, :image_id, :intgere
  end
end
