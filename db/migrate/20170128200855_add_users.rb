
class AddUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.text :name
      t.string :token
      t.string :secret
      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
  end
end