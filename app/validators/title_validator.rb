class TitleValidator < ActiveModel::Validator
    def validate(record)
    #   unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Guess") || record.title.include?("Top ")
        if record.title && !["Won't Believe", "Secrect", "Guess", "Top"].any? { |s| record.title.include? s } 
            record.errors[:name] << "Not click bait enough"
        end
    end
end