
class UseTwitterId < ActiveRecord::Migration[5.0]
  def change
    change_column :tweets, :tweet_id, :string
    add_index :tweets, :tweet_id, unique: true
  end
end