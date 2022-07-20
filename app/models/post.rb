class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

    validate :is_clickbaity

    PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def is_clickbaity
        if PATTERNS.none? { |pattern| pattern.match(title) }
            errors.add(:title, "Not a click-baity title")
        end
    end
end
