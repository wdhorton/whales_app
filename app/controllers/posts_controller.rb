require_relative 'application_controller'

class PostsController < ApplicationController

  def index
    render_content "These are posts", "text/text"
  end
end
