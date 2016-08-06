class Post < ActiveRecord::Base
  belongs_to :blog
  validates :title, :content, :blog_id, presence: true
end
