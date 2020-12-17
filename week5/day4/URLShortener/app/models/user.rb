# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :email, uniqueness: true, presence: true
    has_many :submitted_urls,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :ShortenedUrl
end
