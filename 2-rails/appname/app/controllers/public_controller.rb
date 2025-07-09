class PublicController < ApplicationController

    def homepage
    @posts = Post.all
    render "home"
    end

end