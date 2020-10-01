class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :commentable_id #:item_id
      t.string :commentable_type #:blog_post_id Item или Blog_post
      t.timestamps
    end
  end
end
