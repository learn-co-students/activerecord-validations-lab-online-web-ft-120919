class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :worthy

        def worthy
          if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess")) 
            errors.add(:worthy, "That is not a clickbait worthy title. Try again.")
          end
        end

end
