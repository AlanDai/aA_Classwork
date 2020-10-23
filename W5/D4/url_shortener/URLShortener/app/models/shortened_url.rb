class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, :user_id, presence: true

    def self.random_code
        short_url = SecureRandom.urlsafe_base64
    end
end