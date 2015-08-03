class Post < ActiveRecord::Base
  has_attached_file :image, styles: { :medium => "640x" }
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true
end
