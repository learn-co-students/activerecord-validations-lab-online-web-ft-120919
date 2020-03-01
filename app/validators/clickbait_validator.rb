
require 'byebug'
class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    words =["Won't Believe", "Secret","Top", "Guess"]
    Regexp.union words
    unless Regexp.union(words) === record.title
      record.errors[:title] << "No clickbait"
    end
  end
end