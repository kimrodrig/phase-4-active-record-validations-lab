class Post < ApplicationRecord
    validates :title, presence: true, allow_blank: false
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"] }
    validate :title_is_clickbait


    def title_is_clickbait
        if title
            if !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
                errors.add(:title, "must be more clickbaity")
            end
        end
    end
end
