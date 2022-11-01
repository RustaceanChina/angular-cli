class AddAdditionalFieldsToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :in_use, :boolean
    add_column :tweets, :ignor