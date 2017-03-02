class RemoveNicknameFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :nickname, :string
  end
end
