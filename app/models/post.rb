
class Post < ActiveRecord::Base
 validates :title,
    presence: true
     validates :image,
    presence: true
    validates :contacts,
    presence: true
	belongs_to :user
	has_many :comments
	has_attached_file :image, styles: { medium: "700x550#", small: "350x250#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end