
class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :title_is_clickbait

    CLICKBAIT_WORDS = ["Won't Believe", "Secret", "Top ", "Guess"]

    def title_is_clickbait
        if title
            if CLICKBAIT_WORDS.none? { |word|
                title.include?(word) }
                errors.add(:title, "title isn't clickbait-y")
            end
        end
    end

end
