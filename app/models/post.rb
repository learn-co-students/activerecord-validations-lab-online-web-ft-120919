class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  #validates_inclusion_of :category, in: %w( Fiction Non-Fiction )
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :clickbaity

  def clickbaity

    if title.present?
      wb = title.include?("Won't Believe")
      scrt = title.include?("Secret")
      gss = title.include?("Guess")
      tpnmbr= title.include?("Top /\A[+-]?\d+\z/")
      if !(wb || scrt || gss |tpnmbr)
        errors.add(:title, "Title must be clickbaity")
      end
    end
  end

end
