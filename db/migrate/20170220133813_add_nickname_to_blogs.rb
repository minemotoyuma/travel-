class AddNicknameToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :nickname, :string
  end
end
