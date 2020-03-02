class ClickBaitValidator < ActiveModel::Validator

    def validate(record)
        unless record.title.match?("Won't Believe", "Secret", "Top [number]", "Guess")
            record.errors[:name] << "You're title is not clickbaity enough!"
        end

    end

end
