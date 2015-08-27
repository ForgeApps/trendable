module Trendable
  module Concern
    extend ActiveSupport::Concern

    included do
      scope :order_by_trending, -> { order( trending_power: :desc ) }
    end

    def boost_trending_power( add_value = 1000 )
      self.update_attributes( trending_power: trending_power + add_value )
    end

    def fade_out_trending_power( multiplier = 0.9 )
      self.update_attributes( trending_power: trending_power * multiplier )
    end
  end
end