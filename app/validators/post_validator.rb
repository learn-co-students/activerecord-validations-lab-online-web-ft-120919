class PostValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.include?("Won't Believe")
      record.erros[:title] << "Not clickbaity enough!"
    end
  end
end