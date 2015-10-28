require_relative '../rails_lite_final/myactionpack2/lib/my_action_controller/base'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/posts_controller'


def make_router
  router = MyActionDispatch::Router.new

  router.draw do
    get Regexp.new("^/users/new$"), UsersController, :new
    get Regexp.new("^/session/new$"), SessionsController, :new
    post Regexp.new("^/users$"), UsersController, :create
    post Regexp.new("^/session$"), SessionsController, :create
    delete Regexp.new("^/session$"), SessionsController, :destroy
    get Regexp.new("^/posts$"), PostsController, :index
  end

  router
end
