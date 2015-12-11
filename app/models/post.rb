require 'whales_orm'
require_relative '../../config/database.rb'

class Post < WhalesORM::Base
  belongs_to :user
  self.finalize!
end
