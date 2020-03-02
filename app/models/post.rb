class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction || Non-Fiction)}
    validate :clickbait
    # include ActiveModel::Validations
    # validates_with MyValidator

    def clickbait
        unless !title.nil? && title.match?(/(Won't Believe|Secret|Top D+|Guess)/)
            errors.add :title, "must be clickbait!"
        end 
    end 
end
