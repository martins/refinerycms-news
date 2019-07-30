require 'acts_as_indexed'
require 'friendly_id'
require 'friendly_id/mobility'
require 'refinery/core/base_model'

module Refinery
  module News
    class Item < Refinery::Core::BaseModel
      extend Mobility
      extend FriendlyId
      translates :title, :body, :slug

      alias_attribute :content, :body

      validates :title, :content, :publish_date, presence: true

      validates :source, length: { maximum: 255 }, allow_blank: true

      acts_as_indexed fields: [:title, :body]

      default_scope -> { order(arel_table[:publish_date].desc) }

      friendly_id :title, use: [:mobility]

      # If title changes tell friendly_id to regenerate slug when saving record
      def should_generate_new_friendly_id?
        title_changed?
      end

      def not_published? # has the published date not yet arrived?
        publish_date > Time.current
      end

      def next
        self.class.next(self).published.first
      end

      def prev
        self.class.previous(self).published.first
      end

      class << self
        def by_archive(archive_date)
          where(publish_date: archive_date.beginning_of_month..archive_date.end_of_month)
        end

        def by_year(archive_year)
          where(publish_date: archive_year.beginning_of_year..archive_year.end_of_year)
        end

        def all_previous
          where(['publish_date <= ?', Time.current.beginning_of_month])
        end

        def next(item)
          unscoped.where('publish_date > ?', item.publish_date).order(:publish_date)
        end

        def previous(item)
          where('publish_date < ?', item.publish_date)
        end

        def not_expired
          where(arel_table[:expiration_date].eq(nil).or(arel_table[:expiration_date].gt(Time.current)))
        end

        def published
          not_expired.where('publish_date < ?', Time.current)
        end

        def latest(limit = 10)
          published.limit(limit)
        end

        def live
          not_expired.where('publish_date <= ?', Time.current)
        end

        def archived
          where('publish_date <= ?', Time.current)
        end

        # rejects any item that has not been translated to the current locale.
        def translated
          i18n.join_translations
        end
      end
    end
  end
end
