# This migration comes from refinery_news (originally 7)
class AddSourceToNewsItems < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_news_items, :source, :string
  end
end
