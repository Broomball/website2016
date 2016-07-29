class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string "title", :limit => 30
      t.string "short_description", :limit => 140
      t.string "picture_path", :default => "/assets/default_pic.png"
      t.text "news_body"
      t.timestamps null: false
    end
  end
end
