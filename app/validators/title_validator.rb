class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.include?("Won't Believe", "Secret", "Top [number]", "Guess")
            record.errors.add[:title] << "You Won't Believe These True Facts"
        end
    end
end