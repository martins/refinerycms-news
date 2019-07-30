# This migration comes from refinery_news (originally 8)
class TranslateSource < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_news_item_translations, :source, :string
  end
end
