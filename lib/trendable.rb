require 'rails'
require 'trendable/trendable'
require 'trendable/version'

ActiveSupport.on_load(:active_record) do
  include Trendable::Model
end

module Trendable

end