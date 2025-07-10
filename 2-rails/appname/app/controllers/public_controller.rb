class PublicController < ApplicationController

    def homepage
      @posts = Post.all
    end

    def about
      # Logic for about page
    end

    def contact
      # Logic for contact page
    end

    def blog
      @posts = Post.all
    end 

    def show
      @post = Post.find(params[:id])
    end 

end