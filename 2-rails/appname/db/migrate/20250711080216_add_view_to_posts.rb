class AddViewToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :views, :integer, default: 0, null: false 
  end
end
