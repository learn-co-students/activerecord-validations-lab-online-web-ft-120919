class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validate :click_bait

  def click_bait
    if !title.nil? && (!title.include?("Won't Believe" || "Secret" || "Top" || "Guess"))
      errors.add(:clickbait, "That title is not a clickbait-y enough.")
    end
  end


end

# If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should add a validation.