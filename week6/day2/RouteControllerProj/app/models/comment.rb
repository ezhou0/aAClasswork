class Comment < ApplicationRecord
    belongs_to :commenter,
        foreign_key: :user_id,
        class_name: :User
    
    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork
    
    
end
