module Refinery
  module News
    include ActiveSupport::Configurable

    config_accessor :teasers_enabled, :news_item_teaser_length

    self.teasers_enabled = true
    self.news_item_teaser_length = 250
  end
end
