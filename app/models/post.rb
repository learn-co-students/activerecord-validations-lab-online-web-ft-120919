class Post < ActiveRecord::Base
  #invalid without a title
  validates :title, presence: true
  #invalid with content < 20 characters
  validates :content, length: {minimum: 20}
  #invalid with summary > 200 characters
  validates :summary, length: {maximum: 200}
  #invalid with category not in choices
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction", "Poetry"] }
  #invalid if not include click bait words
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]


  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "not click-baity enough!")
    end
  end
end
