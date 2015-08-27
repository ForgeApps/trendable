class FadeOutTrendPowerWorker
  include Sidekiq::Worker

  def perform
    Rails.application.eager_load! if Rails.env.development?

    ActiveRecord::Base.descendants.each do |klass|
      if klass.respond_to?( "has_trendable_concern?".to_sym )
        klass.all.each do |inst|
          # TODO: Replace with some kind of update_all
          inst.fade_out_trending_power
        end
      else
        puts "#{klass.to_s} does not have trendable concern"
      end
    end
  end
end