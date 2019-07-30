class AddImageIdToNewsItems < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_news_items, :image_id, :integer
  end
end
