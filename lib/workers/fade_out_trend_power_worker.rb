class FadeOutTrendPowerWorker
  include Sidekiq::Worker

  def perform( multiplier = 0.9, batch_size = 1000 )
    Rails.application.eager_load! if Rails.env.development?

    ActiveRecord::Base.descendants.each do |klass|
      if klass.respond_to?( "has_trendable_concern?".to_sym )
        
        klass.items_to_fade_trending_power.find_in_batches( batch_size: batch_size ) do |batch|
          batch.update_all( "trending_power = trending_power * #{multiplier}")
        end
      else
        puts "#{klass.to_s} does not have trendable concern"
      end
    end
  end
end