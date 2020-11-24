class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.json :source
      t.text :author
      t.text :title
      t.text :description
      t.text :url
      t.text :urlToImage
      t.timestamp :publishedAt
      t.text :content

      t.timestamps
    end
  end
end
