class Post < ActiveRecord::Base
  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, class_name: "Post", foreign_key: "main_post_id"
  belongs_to :main_post, class_name: "Post"
end
