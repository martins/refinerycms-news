class MoveSlugToNewsItemTranslations < ActiveRecord::Migration[4.2]
  def change
    remove_column :refinery_news_items, :slug, :string
    add_column :refinery_news_item_translations, :slug, :string
  end
end
