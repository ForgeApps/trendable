module Trendable
  module Concern
    extend ActiveSupport::Concern

    included do
      scope :order_by_trending, -> { order( trending_power: :desc ) }
      scope :items_to_fade_trending_power, -> { where( "trending_power > 0" ) }

      def self.has_trendable_concern?
        true
      end

    end

    def boost_trending_power!( add_value = 1000, dont_touch: false )
      if dont_touch
        self.update_columns( trending_power: trending_power + add_value )
      else
        self.update_attributes( trending_power: trending_power + add_value )
      end
    end

    def fade_out_trending_power!( multiplier = 0.9, dont_touch: false )
      if dont_touch
        self.update_columns( trending_power: trending_power * multiplier )
      else
        self.update_attributes( trending_power: trending_power * multiplier )
      end
    end
  end
end