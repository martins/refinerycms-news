class CreateNewsItems < ActiveRecord::Migration[4.2]
  def change
    create_table :refinery_news_items do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date

      t.timestamps(null: false)
    end
  end
end
