class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string     :nickname
      t.string     :place
      t.string     :title
      t.text       :content
      t.text       :image_url
      t.timestamps 
    end
  end
end
