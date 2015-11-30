require_relative '../whales/whales_actions/lib/whales_controller/base'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/posts_controller'

def make_router
  router = WhalesDispatch::Router.new

  router.draw do
    get Regexp.new("^/users/new$"), UsersController, :new
    get Regexp.new("^/session/new$"), SessionsController, :new
    post Regexp.new("^/users$"), UsersController, :create
    post Regexp.new("^/session$"), SessionsController, :create
    delete Regexp.new("^/session$"), SessionsController, :destroy
    get Regexp.new("^/posts$"), PostsController, :index
    get Regexp.new("^/$"), SessionsController, :new
    get Regexp.new("^/posts/new$"), PostsController, :new
    post Regexp.new("^/posts$"), PostsController, :create
    get Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :show
  end

  router
end
