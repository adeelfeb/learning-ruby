# app/controllers/welcome_controller.rb
class WelcomeController < ApplicationController
  def home
    check_variable = true # This is just a placeholder. Replace with actual logic to determine if the variable should be set.
    # This is the home page of the application.
    # You can add any logic or instance variables needed for the home view here.
    @greeting = "Welcome to our application!"
    @current_time = Time.now
    @features = ["Feature 1", "Feature 2", "Feature 3"] # Example features, you can modify this as needed
    @about_info = "This application is designed to demonstrate the basic structure of a Rails application. It includes a welcome controller with several actions to showcase different pages."
    @contact_info = "For inquiries, please contact us at"

    if check_variable
      @contact_info = "New Contanct Info  for you"
    else
      @contact_info = "For inquiries, please contact us at"
    end

    # Render the home view template.
    logger.info ">>>>>>>>>>>>Rendering home page with greeting: #{@greeting} at #{@current_time}"
    logger.debug ">>>>>>>>>>>>>>>Features available: #{@features.inspect}"
    logger.warn ">>>>>>>>>>>>>>Warning message for the home page rendering."
    logger.error ">>>>>>>>>>>>Error message for the home page rendering." if @features.empty?

    render "welcome/home"
    # This will render the home.html.erb view in app/views/welcome/
    # You can also use render inline or render json if needed.
  rescue StandardError => e
    # Handle any exceptions that occur during the rendering of the home page.
    logger.error "Error rendering home page: #{e.message}"
    render plain: "An error occurred while loading the home page.", status: :internal_server_error
  end

  def features
    # Set multiple flash messages with different keys
    flash[:notice] = "You've been redirected from the Features page."
    flash[:alert] = "Please note this is a temporary redirect!"
    flash[:success] = "Operation completed successfully."
    flash[:info] = "Here's some additional information."

    redirect_to welcome_about_path
  end


  def about
    # This action doesn't need explicit rendering if you have app/views/welcome/about.html.erb
    # Rails will automatically look for a template matching the action name.
  end

  def contact
    # This action doesn't need explicit rendering if you have app/views/welcome/contact.html.erb
  end
end
