# trendable

Add management for ordering your models by a trending popularity value.

## Installation

    gem 'trendable'

    $ bundle install

    # Add a migration:
    $ rails g trendable:migration widget
    $ bundle exec rake db:migrate

    # Update your model to include the concern
    # app/models/widget.rb

    include Trendable::Concern

## Usage

    Widget.first.boost_trending_power

    Widget.order_by_trending

    20.times{ Widget.first.fade_trending_power }

    Widget.order_by_trending
    
You can use the `FadeOutTrendPowerWorker` to lower the trending power over time.

For example, you might run it once an hour to fade out the power of the widget. In this way, the more recent the boost, the more trending power.

Note that the `FadeOutTrendingPowerWorker` does not hit any callbacks. It's an `update_all` on the table (for performance).