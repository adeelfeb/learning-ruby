class PublicController < ApplicationController

    def homepage
      @posts = Post.all
    end

end