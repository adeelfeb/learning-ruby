class User < ApplicationRecord


    # having association with other models in rails 
    has_many :posts
end