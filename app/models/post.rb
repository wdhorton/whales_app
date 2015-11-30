require_relative '../../../whales/whales_orm/lib/base'
require_relative '../../config/database.rb'

class Post < WhalesORM::Base
  belongs_to :user
  self.finalize!
end
