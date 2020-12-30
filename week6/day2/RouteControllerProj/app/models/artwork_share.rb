class ArtworkShare < ApplicationRecord 

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork


    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User,
        dependent: :destroy
end