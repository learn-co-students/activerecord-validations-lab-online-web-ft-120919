class TitleValidator < ActiveModel::Validator
    def validate(record)
        if record.title
            unless record.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
                record.errors[:title] << "needs more clickbait"
            end
        end
    end
end