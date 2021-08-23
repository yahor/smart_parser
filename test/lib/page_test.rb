# frozen_string_literal: true

require 'test_helper'

class PageTest < Minitest::Test
  def setup
    @ips = ['123.123.123', '123.123.123', '127.0.0.1']
    @page = SmartParser::Page.new(url: '/home', ips: @ips)
    @no_views_page = SmartParser::Page.new(url: '/home')
  end

  def test_url_assign
    assert_equal(@page.url, '/home')
  end

  def test_ips_assign
    assert_equal(@page.ips, @ips)
  end

  def test_views
    assert_equal(@page.views, @ips.size)
  end

  def test_unique_visits
    assert_equal(@page.unique_visits, @ips.uniq.size)
  end

  def test_no_ips_assign
    assert_equal(@no_views_page.ips, [])
  end

  def test_no_views
    assert_equal(@no_views_page.views, 0)
  end

  def test_no_unique_visits
    assert_equal(@no_views_page.unique_visits, 0)
  end
end
