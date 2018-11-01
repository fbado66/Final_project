class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :post
      t.references :comment
      t.timestamps
    end
  end
end
