# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  long_url     :string           not null
#  short_url    :string           not null
#  submitter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, :submitter, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        loop do
            #generate a random code with given
            random_code = SecureRandom.urlsafe_base64(16)
            #returning the random string unless the random string already exists
            return random_code unless ShortenedUrl.exists?(short_url: random_code)#shortened url already exists
        end
    end

    #creates a new object containing the randomly generated shorturl code
    def self.create_short_url!(user, long_url)
        ShortenedUrl.create!(
            submitter_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end


    #submitter and submitted urls associations
    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User

    has_many :visits,
        primary_key: :id,
        foreign_key: :shortened_url_id,
        class_name: :Visit

    has_many :visitors,
        through: :visits,
        source: :Visitor


end
