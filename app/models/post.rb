require "pry"

class Post < ActiveRecord::Base

validates :title, presence: true 
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
validate :set_clickbait
def set_clickbait
    # binding.pry
# if !title.match(/Won't Believe|Secret|Top [0-9]*|Guess/)
#     errors.add(:title, "clickbait")
# end

if !(/Won't Believe|Secret|Top [0-9]*|Guess/).match(title)
    errors.add(:title, "clickbait")
   end
end 

end
