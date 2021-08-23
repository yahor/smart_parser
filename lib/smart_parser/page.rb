module SmartParser
  class Page
    attr_reader :url, :ips, :views, :unique_visits

    def initialize(args)
      @url = args[:url]
      @ips = args[:ips] || []
    end

    def views
      @views ||= @ips.count
    end

    def unique_visits
      @unique_visits ||= @ips.uniq.count
    end
  end
end
