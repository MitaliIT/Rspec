class AddBlogNameToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :blog_name, :string
    add_column :blogs, :blog_score, :integer
    add_column :blogs, :content, :text
    add_reference :blogs, :user, null: true, foreign_key: true
  end
end
