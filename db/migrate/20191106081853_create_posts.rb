class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.string :user

      t.timestamps
    end
  end
end
