# trendable

Add management for ordering your models by a trending popularity value.

## Installation

    gem 'trendable'

    $ bundle install

    # Add a migration:
    $ rails g trendable:migration widget

    # Update your model to include the concern
    # app/models/widget.rb

    include Trendable::Concern

## Usage

    Widget.first.boost_trending_power

    Widget.order_by_trending

    20.times{ Widget.first.fade_trending_power }

    Widget.order_by_trending