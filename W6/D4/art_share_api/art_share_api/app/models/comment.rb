class Comment < ApplicationRecord

    belongs_to :commenter, 
        primary_key: :id, 
        foreign_key: :user_id, 
        class_name: :User

    belongs_to :commented_artwork, 
        primary_key: :id, 
        foreign_key: :artwork_id, 
        class_name: :Artwork 

    
end
