class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbait_title

    def clickbait_title
        if title && (!title.include?("You Won't" || "Secret" || "Top" || "Guess"))
            errors.add(:clickbait_title, "That title isn't clickbaity enough.")
        end
    end
end
