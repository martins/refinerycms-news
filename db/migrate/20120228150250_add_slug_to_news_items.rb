class AddSlugToNewsItems < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_news_items, :slug, :string
  end
end
