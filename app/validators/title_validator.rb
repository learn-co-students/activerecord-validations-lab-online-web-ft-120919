class TitleValidator < ActiveModel::Validator
  def validate(record)
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    if record.title
      unless clickbait.any? {|word| record.title.include?(word)}
        record.errors[:title] << "Not clickbait"
      end
    end
  end
end