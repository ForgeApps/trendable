class FadeOutTrendPowerWorker
  include Sidekiq::Worker

  def perform( multiplier = 0.9 )
    Rails.application.eager_load! if Rails.env.development?

    ActiveRecord::Base.descendants.each do |klass|
      if klass.respond_to?( "has_trendable_concern?".to_sym )
        
        klass.update_all( "trending_power = trending_power * #{multiplier}")
      else
        puts "#{klass.to_s} does not have trendable concern"
      end
    end
  end
end