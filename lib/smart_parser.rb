require "smart_parser/version"
require "smart_parser/data_loader"
require "smart_parser/page"
require 'ptools'

module SmartParser
  class Error < StandardError; end

  class Report
    attr_reader :data_lines, :pages

    def initialize(args={})
      @data_lines = args[:data_lines]
      @pages = []
    end

    def perform
      grab_pages
      puts "Report:"
      views_report_for(@pages.sort_by{|page| page.views}.reverse)
      unique_visits_report_for(@pages.sort_by{|page| page.unique_visits}.reverse)

      true
    end

    private

    def grab_pages
      ips_by_page = Hash.new([])

      data_lines.each do |line|
        ips_by_page[line.first] = ips_by_page[line.first] + [line.last]
      end

      ips_by_page.each do |url, ips|
        @pages << SmartParser::Page.new(url: url, ips: ips)
      end
    end

    def views_report_for(pages)
      pages.each do |page|
        puts "#{page.url} #{page.views} visits"
      end
    end

    def unique_visits_report_for(pages)
      pages.each do |page|
        puts "#{page.url} #{page.unique_visits} unique views"
      end
    end
  end
end
