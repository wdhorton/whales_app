require_relative '../../../rails_lite_final/myactiverecord/lib/base'

class Post < MyActiveRecord::Base
  belongs_to :user
  self.finalize!
end
