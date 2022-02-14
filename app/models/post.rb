class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :clickbait

    def clickbait
        needs = ["Won't Believe", "Secret", "Top "]

        is_bait = needs.any? do |bait|
            self.title.include?(bait) if self.title
        end

        errors.add(:title, "Is not Clickbait") if !is_bait

    end
end
