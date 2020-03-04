class PostValidator < ActiveModel::Validator
  def validate(post)
    if post.title
      clickbait_headers = [/^You Won't Believe/, /^Secret/, /^Top \d+/, /Guess/]
      unless clickbait_headers.any?{ |header| post.title.match?(header) }
        post.errors[:title] << "needs to be more clickbait-y"
      end
    end
  end
end