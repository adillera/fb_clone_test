class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.references :main_post, index: true
      t.string :post

      t.timestamps
    end
  end
end
