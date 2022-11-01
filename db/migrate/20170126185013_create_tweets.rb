class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :tweet_id
      t.text :text
      t.string :category_slug
      t.timestamps
    end
  end
end
