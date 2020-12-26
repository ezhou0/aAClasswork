class User < ApplicationRecord
    has_many :authored_polls,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :poll
    has_many :responses,
        primary_key: :id,
        foreign_key: :respondent_id,
        class_name: :response
    
end