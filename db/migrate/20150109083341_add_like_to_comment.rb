class AddLikeToComment < ActiveRecord::Migration
  def change
    add_column :comments, :comments, :string
    add_column :comments, :like, :int
  end
end
