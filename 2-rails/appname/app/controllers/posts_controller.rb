# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  # This callback runs the `set_post` method before the `show`, `edit`, `update`, and `destroy` actions.
  # It ensures that @post is loaded for these actions.
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  # Displays a list of all posts.
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # Displays the details of a single post.
  def show
    # @post is already set by the `set_post` before_action.
  end

  # GET /posts/new
  # Prepares a new, empty Post object for the creation form.
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  # Fetches an existing post and prepares it for the edit form.
  def edit
    # @post is already set by the `set_post` before_action.
  end

  # POST /posts
  # Handles the submission of the new post form and attempts to save the post.
  def create
    @post = Post.new(post_params) # Create a new Post object with permitted parameters

    if @post.save
      # If the post is successfully saved, redirect to its show page
      # and set a flash notice message.
      redirect_to @post, notice: "Post was successfully created."
    else
      # If saving fails (e.g., due to validations), re-render the new post form
      # and set the HTTP status to 422 Unprocessable Entity.
      # The @post object will contain validation errors, which the view can display.
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # Handles the submission of the edit post form and attempts to update the post.
  def update
    # @post is already set by the `set_post` before_action.
    if @post.update(post_params)
      # If the post is successfully updated, redirect to its show page
      # and set a flash notice message.
      redirect_to @post, notice: "Post was successfully updated."
    else
      # If updating fails, re-render the edit form
      # and set the HTTP status to 422 Unprocessable Entity.
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # Deletes a specific post from the database.
  def destroy
    # @post is already set by the `set_post` before_action.
    @post.destroy! # Deletes the post. The `!` will raise an error if deletion fails.

    # After successful deletion, redirect to the posts index page
    # and set a flash notice message.
    # `status: :see_other` (HTTP 303) is a common practice after a DELETE request.
    redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # This method finds a Post by its ID from the URL parameters.
  def set_post
    # Corrected: Use params[:id] to access the ID from the URL.
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # If a post with the given ID is not found, redirect to the index page
    # and set a flash alert message.
    redirect_to posts_path, alert: "Post not found."
  end

  # Only allow a list of trusted parameters through.
  # This is Rails' Strong Parameters feature, crucial for security.
  def post_params
    # Corrected: Use params.require(:model_name).permit(:allowed_attribute1, ...)
    # It requires a top-level `:post` key and permits only the specified attributes
    # for mass assignment.
    params.require(:post).permit(:title, :summary, :body, :active, :category_id)
  end
end
