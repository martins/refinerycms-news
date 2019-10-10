class TranslateNewsItems < ActiveRecord::Migration[4.2]
  def change
    create_table :refinery_news_item_translations do |t|
      # Translated attribute(s)
      t.string :title
      t.text :body

      t.string :locale, null: false
      t.integer :refinery_news_item_id, null: false

      t.timestamps null: false
    end

    add_index :refinery_news_item_translations, :locale, name: :index_refinery_news_translations_on_locale
    add_index :refinery_news_item_translations, [:refinery_news_item_id, :locale], name: :index_2mno5zfnvxdf4fd576nsaqrr1lry3cs87sig3hyf, unique: true
  end
end
