class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.match?("Won't Believe", "Secret", "Top [number]", "Guess")
            binding.pry
            record.errors.add :title, "Invalid not clickbait"
        end
    end
end