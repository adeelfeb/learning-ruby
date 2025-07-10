class Post < ApplicationRecord
    validates :title, presence: true
    validates :summary, presence: true, length: { maximum: 10 }
    validates :active, inclusion: { in: [true, false] }
    validates :body, presence: true, length: { minimum: 9 }

    belongs_to :category
   

    def details
      "This post was created on #{created_at.strftime("%d %m %y")}"
    end

    def self.total
        #returning total number of posts
    #    all.size 
       # even simpler version would be 
       count # this would be called automatically on the Post 
    end
end