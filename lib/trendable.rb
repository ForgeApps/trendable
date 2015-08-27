require 'rails'
require 'concerns/trendable'
require 'workers/fade_out_trend_power_worker'
require 'trendable/trendable'
require 'trendable/engine'
require 'trendable/version'

# ActiveSupport.on_load(:active_record) do
#   include Trendable::Manager
# end

module Trendable
  class Manager
  end
end