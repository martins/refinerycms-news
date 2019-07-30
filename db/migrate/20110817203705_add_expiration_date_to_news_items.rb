class AddExpirationDateToNewsItems < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_news_items, :expiration_date, :datetime
  end
end
