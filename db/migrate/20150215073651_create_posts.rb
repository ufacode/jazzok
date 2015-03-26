class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :intro
      t.text :content
      t.string :state
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end
