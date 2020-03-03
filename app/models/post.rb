class Post < ActiveRecord::Base
    validates :title, presence: true
    validate :title_is_clickbait
    validates :content, presence: true, length: {minimum: 250}
    validates :summary, presence: true, length: {maximum: 250}
    validates :category, presence: true, inclusion: {in: %w(Fiction Non-fiction)}

    def title_is_clickbait
        if !title
            errors.add(:title, "can't be empty")
        elsif title.include?("Top")
            array = title.split(" ")
            index = array.index("Top") + 1
            if array[index].to_i != 0
                return
            end
        elsif title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess")
            return
        end
        errors.add(:title, "not clickbaity!")
    end

end
