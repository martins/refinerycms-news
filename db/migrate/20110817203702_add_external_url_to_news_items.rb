class AddExternalUrlToNewsItems < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_news_items, :external_url, :string
  end
end
